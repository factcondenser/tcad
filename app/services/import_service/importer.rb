# frozen_string_literal: true

module ImportService
  class Importer
    DEFAULT_BATCH_SIZE = 2000
    DEFAULT_NUM_LINES_TO_DROP = 0
    ENCODING = 'ISO-8859-1'

    def initialize(record_type, opts = {})
      @record_type = record_type
      @batch_size = opts[:batch_size].presence&.to_i || DEFAULT_BATCH_SIZE
      @num_lines_to_drop = opts[:num_lines_to_drop].presence&.to_i || DEFAULT_NUM_LINES_TO_DROP
    end

    def call
      batch_count = 0
      line_count = 0

      file.lazy.drop(num_lines_to_drop).each_slice(batch_size) do |lines|
        records = records_from_lines(lines, batch_count += 1, line_count)
        import_records(records)

        line_count += lines.count
      end

      puts "[#{self.class.name}] #{record_class} - processed #{batch_count} of #{total_batch_count} batches (#{line_count} of #{total_line_count} lines)".light_green
    end

    private

    attr_reader :record_type, :batch_size, :num_lines_to_drop

    def records_from_lines(lines, batch_count, line_count)
      lines.map do |line|
        print "[#{self.class.name}] #{record_class} - processing batch #{batch_count} of #{total_batch_count} (line #{line_count += 1} of #{total_line_count})\r".light_cyan

        record_class.new(attribute_hash_from_line(line))
      end
    end

    def attribute_hash_from_line(line)
      fields.each_with_object({}) do |field, attributes|
        field_value = field.value_from_line(line)
        attributes[field.name] = field_value if field_value.present?
      rescue StandardError => e
        Rails.logger.error(<<-HEREDOC.strip_heredoc)
          #{['[', self.class.name, ']'].join.red}
          Record Class: #{record_class}
          Field: #{field.attributes}
          Error: #{e}
        HEREDOC
      end
    end

    def import_records(records)
      record_class.import(records, validate: false, on_duplicate_key_ignore: true)
    end

    def fields
      @fields ||= FieldsParser.new(record_type).call
    end

    def file
      @file ||= File.open(file_path, "r:#{ENCODING}")
    end

    def file_path
      @file_path ||= Rails.configuration.import_files_path.join("#{record_type.upcase}.TXT")
    end

    def record_class
      @record_class ||= record_type.camelize.constantize
    end

    def total_batch_count
      @total_batch_count ||= (total_line_count / batch_size.to_f).ceil
    end

    def total_line_count
      @total_line_count ||= `wc -l #{file_path}`.split[0].to_i - num_lines_to_drop
    end
  end
end

# frozen_string_literal: true

module ImportService
  class Importer
    DEFAULT_CHUNK_SIZE = 50_000
    DEFAULT_BATCH_SIZE = 2000
    DEFAULT_START_FROM_LINE = 1
    ENCODING = 'ISO-8859-1'

    def initialize(record_type, opts = {})
      @record_type = record_type
      @chunk_size = opts[:chunk_size].presence&.to_i || DEFAULT_CHUNK_SIZE
      @batch_size = opts[:batch_size].presence&.to_i || DEFAULT_BATCH_SIZE
      @start_from_line = opts[:start_from_line].presence&.to_i || DEFAULT_START_FROM_LINE
    end

    def call
      system(split_file_command)

      tmp_file_paths ||= Dir[tmp_dir_path.join('*')]
      total_chunks = tmp_file_paths.length

      Parallel.each_with_index(tmp_file_paths) do |tmp_file_path, i|
        process(tmp_file_path, i + 1, total_chunks)
      end

      system("rm -rf #{tmp_dir_path}")
    end

    private

    attr_reader :record_type, :batch_size, :start_from_line

    def process(tmp_file_path, current_chunk, total_chunks)
      puts("processing chunk #{current_chunk} of #{total_chunks}".light_cyan)

      File.open(tmp_file_path, "r:#{ENCODING}").lazy.each_slice(batch_size) do |lines|
        records = records_from_lines(lines)
        import_records(records)
      end

      puts("done processing chunk #{current_chunk} of #{total_chunks}".light_green)
    end

    def records_from_lines(lines)
      lines.map do |line|
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

    def split_file_command
      "mkdir -p #{tmp_dir_path}; tail -n +#{start_from_line} | split -l #{MAX_LINES_PER_TMP_FILE} #{file_path} #{tmp_dir_path}/"
    end

    def tmp_dir_path
      @tmp_dir_path ||= Rails.root.join('tmp', record_type)
    end

    def file_path
      @file_path ||= Rails.configuration.import_files_path.join("#{record_type.upcase}.TXT")
    end

    def record_class
      @record_class ||= record_type.camelize.constantize
    end
  end
end

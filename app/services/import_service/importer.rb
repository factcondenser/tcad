# frozen_string_literal: true

module ImportService
  class Importer
    DEFAULT_CHUNK_SIZE = 25_000
    DEFAULT_BATCH_SIZE = 2000
    ENCODING = 'ISO-8859-1'
    TCAD_EXPORT_FILES_LOCATION_URL = 'https://www.dropbox.com/sh/dh1idu6nx0wmt6n/AABSBEPDUUQIpY7olLYQ59Loa?dl=0'

    def initialize(record_type, opts = {})
      @record_type = record_type
      @chunk_size = opts[:chunk_size].presence&.to_i || DEFAULT_CHUNK_SIZE
      @batch_size = opts[:batch_size].presence&.to_i || DEFAULT_BATCH_SIZE
    end

    def call
      unless File.exist?(file_path)
        puts("couldn't find #{file_path}", :light_red)
        puts("TCAD export files can be downloaded from #{TCAD_EXPORT_FILES_LOCATION_URL}", :light_cyan)
        return
      end

      split_file

      tmp_file_paths ||= Dir[tmp_dir_path.join('*')]
      total_chunks = tmp_file_paths.length

      Parallel.each_with_index(tmp_file_paths) do |tmp_file_path, i|
        process(tmp_file_path, i + 1, total_chunks)
      end

      system("rm -rf #{tmp_dir_path}")
    end

    private

    attr_reader :record_type, :chunk_size, :batch_size

    def process(tmp_file_path, current_chunk, total_chunks)
      puts("processing chunk #{current_chunk} of #{total_chunks}...", :light_cyan)

      File.open(tmp_file_path, "r:#{ENCODING}").lazy.each_slice(batch_size) do |lines|
        records = records_from_lines(lines)
        import_records(records)
      end

      puts("finished chunk #{current_chunk} of #{total_chunks}", :light_green)
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

    def split_file
      puts("splitting import file into chunks with max size of #{chunk_size} lines...\r", :light_cyan)
      system(split_file_command)
      puts("finished splitting import file", :light_green)
    end

    def split_file_command
      "mkdir -p #{tmp_dir_path}; split -l #{chunk_size} #{file_path} #{tmp_dir_path}/"
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

    def puts(message, color)
      super("[#{self.class.name}] #{record_class} - #{message}".public_send(color))
    end
  end
end

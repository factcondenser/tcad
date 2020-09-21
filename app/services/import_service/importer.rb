# frozen_string_literal: true

module ImportService
  class Importer
    BATCH_SIZE = 1000

    def initialize(record_type)
      @file = File.open(Rails.configuration.import_files_path.join("#{record_type.upcase}.TXT"), 'r')
      @fields = FieldsParser.new(record_type).call
      @record_class = record_type.camelize.constantize
    end

    def call
      build_and_import_records
    end

    private

    attr_reader :file, :fields, :record_class

    def build_and_import_records
      file.lazy.each_slice(BATCH_SIZE) do |lines|
        records = lines.each_with_object([]) do |line, arr|
          arr << record_class.new(attributes_from_line(line))
        end
        import_records(records)
      end
    end

    def attributes_from_line(line)
      fields.each_with_object({}) do |field, attributes|
        attributes[field.name] = field_value_from_line(field, line)
      end
    end

    def field_value_from_line(field, line)
      field_value = line.slice(field.start_idx, field.length).strip

      field.date_field? ? date_field_value(field_value) : field_value
    end

    def date_field_value(field_value)
      Date.parse(field_value)
    rescue Date::Error
      Date.strptime(field_value, '%m%d%Y')
    end

    def import_records(records)
      record_class.import(records, on_duplicate_key_ignore: true)
    end
  end
end

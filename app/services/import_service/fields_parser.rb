# frozen_string_literal: true

require 'csv'

module ImportService
  class FieldsParser
    FILLER_FIELD_NAME = 'filler'

    def initialize(record_type)
      @record_type = record_type
    end

    def call
      parse_fields_file
    end

    private

    attr_reader :record_type

    def parse_fields_file
      CSV.parse(fields_file, headers: true).each_with_object([]) do |field, fields|
        parsed = ParsedField.new(field)
        fields << parsed unless parsed.name.casecmp?(FILLER_FIELD_NAME)
      end
    end

    def fields_file
      @fields_file ||= File.open(fields_file_path, 'r')
    end

    def fields_file_path
      @fields_file_path ||= Rails.configuration.import_files_path.join("#{record_type}_fields.csv")
    end
  end
end

# frozen_string_literal: true

require 'csv'

module ImportService
  class FieldsParser
    FILLER_FIELD_NAME = 'filler'

    def initialize(record_type)
      @fields_file = File.open(Rails.configuration.import_files_path.join("#{record_type}_fields.csv"), 'r')
    end

    def call
      parse_fields_file
    end

    private

    attr_reader :fields_file

    def parse_fields_file
      CSV.parse(fields_file, headers: true).each_with_object([]) do |field, fields|
        parsed = ParsedField.new(field)
        fields << parsed unless parsed.name.casecmp?(FILLER_FIELD_NAME)
      end
    end
  end
end

# frozen_string_literal: true

module ImportService
  class ModelGenerationStringBuilder
    def initialize(record_type)
      @record_type = record_type
    end

    def call
      "rails g model #{record_type.camelize} #{column_strings.join(' ')}".strip
    end

    private

    attr_reader :record_type

    def column_strings
      @column_strings ||= fields.map do |field|
        column_string = "#{field.name}:#{field.column_type}"
        modifier_string = [field.column_limit, field.column_scale].compact.join(',')

        if modifier_string.present?
          "'#{column_string}{#{modifier_string}}'"
        else
          column_string
        end
      end
    end

    def fields
      @fields ||= FieldsParser.new(record_type).call
    end
  end
end

# frozen_string_literal: true

module ImportService
  class MigrationModificationStringBuilder
    BOOLEAN_COLUMN_REGEX = '(t.boolean :.+)'
    BOOLEAN_COLUMN_MODIFIERS_REGEX = '\\1, null: false, default: false'

    def initialize(record_type)
      @record_type = record_type
    end

    def call
      [
        modify_boolean_columns_string,
        add_comment_to_columns_string
      ].join(";\n")
    end

    private

    attr_reader :record_type

    def modify_boolean_columns_string
      "gsed -i -E 's~#{BOOLEAN_COLUMN_REGEX}~#{BOOLEAN_COLUMN_MODIFIERS_REGEX}~g' #{migration_file_location}"
    end

    def add_comment_to_columns_string
      fields.map { |field| add_comment_to_column_string(field) }.join(";\n")
    end

    def add_comment_to_column_string(field)
      %(gsed -i -E 's~#{column_regex_from_field(field)}~#{column_modifier_regex_from_field(field)}~' #{migration_file_location})
    end

    def column_regex_from_field(field)
      "(t.#{field.column_type} :#{field.name}($|[, ].*))"
    end

    def column_modifier_regex_from_field(field)
      "\\1, comment: \"#{Regexp.escape(field.description).delete('"')}\""
    end

    def fields
      @fields ||= FieldsParser.new(record_type).call
    end

    def migration_file_location
      @migration_file_location ||= Rails.root.join('db', 'migrate', "*_create_#{record_type.pluralize}.rb")
    end
  end
end

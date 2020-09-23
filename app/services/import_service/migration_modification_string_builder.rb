# frozen_string_literal: true

module ImportService
  class MigrationModificationStringBuilder
    BOOLEAN_COLUMN_REGEX = '(t.boolean :[a-zA-Z1-9_]+)'
    BOOLEAN_COLUMN_REPLACEMENT_REGEX = '\\1, null: false, default: false'

    def initialize(record_type)
      @record_type = record_type
    end

    def call
      "sed -i '' -E 's/#{BOOLEAN_COLUMN_REGEX}/#{BOOLEAN_COLUMN_REPLACEMENT_REGEX}/g' #{migration_file_location}"
    end

    private

    attr_reader :record_type

    def migration_file_location
      @migration_file_location ||= Rails.root.join('db', 'migrate', "*_create_#{record_type.pluralize}.rb")
    end
  end
end

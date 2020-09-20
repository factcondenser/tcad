# frozen_string_literal: true

module ImportService
  class ParsedField
    DATATYPE_REGEX = /^(\w+)\((\d+)\)$/.freeze
    DATATYPE_TO_COLUMN_TYPE_MAP = {
      'char' => 'string',
      'character' => 'string',
      'int' => 'integer',
      'numeric' => 'integer',
      'varchar' => 'string'
    }.freeze
    START_INDEX_OFFSET = 1

    def initialize(field)
      @field = field
    end

    def name
      @name ||= field['Field Name'].strip
    end

    def column_type
      @column_type ||= parsed_datatype[0]
    end

    def column_limit
      @column_limit ||= parsed_datatype[1]
    end

    def description
      @description ||= field['Description'].strip
    end

    def start_idx
      @start_idx ||= field['Start'].strip.to_i - START_INDEX_OFFSET
    end

    def end_idx
      @end_idx ||= field['End'].strip.to_i - START_INDEX_OFFSET
    end

    def length
      @length ||= field['Length'].strip.to_i
    end

    def date_field?
      @date_field ||= begin
        name.start_with?('date_') ||
          name.end_with?('_date') ||
          name.include?('_date_')
      end
    end

    private

    attr_reader :field

    def parsed_datatype
      return @parsed_datatype if defined?(@parsed_datatype)

      datatype, limit = matched_datatype.captures
      raise "unrecognized datatype: #{datatype}" unless DATATYPE_TO_COLUMN_TYPE_MAP.key?(datatype)
      raise "datatype limit does not match field length: #{field}" if limit.to_i != length

      column_type = date_field? ? 'date' : DATATYPE_TO_COLUMN_TYPE_MAP[datatype]
      column_limit = column_type == 'string' ? limit.to_i : nil

      @parsed_datatype = [column_type, column_limit]
    end

    def matched_datatype
      @matched_datatype ||= field['Datatype'].strip.match(DATATYPE_REGEX).tap do |match|
        raise "incorrectly formatted datatype: #{field['Datatype']}" if match.blank?
      end
    end
  end
end

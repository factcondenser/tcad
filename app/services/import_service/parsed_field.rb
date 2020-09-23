# frozen_string_literal: true

module ImportService
  class ParsedField
    include AttributesHash

    BOOLEAN_TRUE_VALUES = Set['T', 't', 'Y', 'y']
    BOOLEAN_FALSE_VALUES = Set['F', 'f', 'N', 'n']
    DATATYPE_REGEX = /^(\w+)\((\d+)(?:,(\d+))?\)$/.freeze
    DATATYPE_MAP = {
      'char' => 'string',
      'int' => 'integer',
      'numeric' => 'integer',
      'varchar' => 'string'
    }.freeze
    DECIMAL_DEFAULT_SCALE = 10
    START_INDEX_OFFSET = 1

    attributes :name, :column_type, :column_limit, :column_scale, :description, :start_idx, :end_idx, :length

    def initialize(field)
      @field = field
    end

    def name
      @name ||= field['Field Name'].strip
    end

    def column_type
      @column_type ||= begin
        return 'boolean' if boolean_field?
        return 'date' if date_field?
        return 'decimal' if decimal_field?

        DATATYPE_MAP[datatype]
      end
    end

    def column_limit
      return unless column_type.in?(%w[string decimal])

      limit
    end

    def column_scale
      return unless column_type == 'decimal'

      scale || DECIMAL_DEFAULT_SCALE
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

    def value_from_line(line)
      value = line.slice(start_idx, length).strip
      return if value.blank?
      return boolean_value(value) if boolean_field?
      return date_value(value) if date_field?
      return decimal_value(value) if decimal_field?

      value
    end

    private

    attr_reader :field

    def boolean_field?
      return @boolean_field if defined?(@boolean_field)

      @boolean_field = datatype.in?(%w[char varchar]) && limit == 1
    end

    def boolean_value(value)
      return true if value.in?(BOOLEAN_TRUE_VALUES)
      return false if value.in?(BOOLEAN_FALSE_VALUES)

      raise "unexpected value for boolean field: #{value}"
    end

    def date_field?
      return @date_field if defined?(@date_field)

      @date_field = name.start_with?('date_') || name.end_with?('_date') || name.include?('_date_')
    end

    def date_value(value)
      pattern = value.include?('/') ? '%m/%d/%Y' : '%m%d%Y'
      Date.strptime(value, pattern)
    end

    def decimal_field?
      return @decimal_field if defined?(@decimal_field)

      @decimal_field =
        datatype == 'numeric' && (
          scale.present? ||
          name.end_with?('_factor') ||
          name.end_with?('_pct') ||
          name.include?('_pct_')
        )
    end

    def decimal_value(value)
      whole_part_length = column_limit - column_scale
      return value if value.length < whole_part_length

      value.insert(whole_part_length, '.')
    end

    def datatype
      @datatype ||= parsed_datatype[0].tap do |dt|
        raise "unrecognized datatype: #{dt}" unless DATATYPE_MAP.key?(dt)
      end
    end

    def limit
      @limit ||= parsed_datatype[1].to_i.tap do |lim|
        raise "datatype limit does not match field length: #{field}" if lim != length
      end
    end

    def scale
      return @scale if defined?(@scale)

      sc = parsed_datatype[2]
      raise "datatype scale exceeds datatype precision: #{field}" if sc.to_i > limit

      @scale = sc.presence&.to_i
    end

    def parsed_datatype
      @parsed_datatype ||= begin
        match = field['Datatype'].strip.match(DATATYPE_REGEX)
        raise "incorrectly formatted datatype: #{field['Datatype']}" if match.blank?

        match.captures
      end
    end
  end
end

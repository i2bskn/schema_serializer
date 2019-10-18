class SchemaSerializer
  class Schema
    attr_reader :key, :type, :nullable, :items, :required, :properties

    def initialize(key, hash = {})
      @key      = key
      @type     = hash["type"]
      @nullable = !hash["nullable"].nil?

      case type
      when "array"
        @items = self.class.new(hash.fetch("items"))
      when "object", nil
        @required = hash["required"] || []
        @properties = hash.fetch("properties").each_with_object({}) { |(column, property), obj|
          obj[column] = self.class.new(property)
        }
      end
    end

    def serialize(object)
      if object.nil?
        return nil if nullable
        raise NullValue, "#{key} is not allowed to be null" if SchemaSerializer.config.raise_on_null
      end

      case type
      when "integer"
        object.to_i
      when "number"
        object.to_f
      when "string"
        object.to_s
      when "boolean"
        !!object
      when "array"
        object.map { |item| items.serialize(item) }
      else
        not_enough_columns = required - properties.keys
        raise RequiredNotDefined, not_enough_columns.join(", ") unless not_enough_columns.empty?

        properties.each_with_object({}) { |(column, schema), obj|
          obj[column] = schema.serialize(get_value(object, column))
        }
      end
    end

    private

      def get_value(object, column)
        return object[column] || object[column.to_sym] if object.is_a?(Hash)

        value = object.public_send(column)
        return value if !object.respond_to?(:defined_enums) || !object.defined_enums.has_key?(column)

        object.defined_enums[column][value]
      end
  end
end

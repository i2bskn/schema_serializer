class SchemaSerializer
  class Schema
    attr_reader :type, :nullable, :items, :required, :properties

    def initialize(hash = {})
      @type     = hash["type"]
      @nullable = !!hash["nullable"]

      case type
      when "array"
        @items = self.class.new(hash.fetch("items"))
      when "object", nil
        @required = hash["required"] || []
        @properties = hash.fetch("properties").each_with_object({}) { |(column, _hash), obj|
          obj[column] = self.class.new(_hash)
        }
      end
    end

    def serialize(object)
      return nil if nullable && object.nil?

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
          obj[column] = schema.serialize(object.public_send(column))
        }
      end
    end
  end
end

class SchemaSerializer
  class Definition
    attr_reader :schemas

    def initialize(hash)
      @schemas = hash.each_with_object({}) { |(name, schema), obj|
        obj[name.to_s] = Schema.new(schema)
      }
    end

    def schema(name)
      schemas[name] || (raise SchemaNotFound, name)
    end
  end
end

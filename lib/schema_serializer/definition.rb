class SchemaSerializer
  class Definition
    attr_reader :schemas

    def initialize(hash)
      @schemas = hash.each_with_object({}) { |(name, hash), obj|
        obj[name.to_s] = Schema.new(hash)
      }
    end

    def find(name)
      schemas[name] || (raise SchemaNotFound, name)
    end
  end
end

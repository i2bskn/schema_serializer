require "active_support"
require "active_support/core_ext"

require "schema_serializer/schema"
require "schema_serializer/version"

class SchemaSerializer
  attr_reader :object

  class << self
    def schemas
      @schemas
    end

    def schemas=(hash)
      @schemas = hash
    end
  end

  def initialize(object)
    @object = object
  end

  def as_json
    schema.serialize(self)
  end

  def schema
    self.class.schemas[object.class.to_s] || (raise "schema not found")
  end

  private

    def method_missing(name, *args, &block)
      super unless object.respond_to?(name)

      define_singleton_method(name) do |*a, &b|
        object.public_send(name)
      end

      send(name, *args, &block)
    end

    def respond_to_missing?(name, include_private = false)
      object.respond_to?(name)
    end
end

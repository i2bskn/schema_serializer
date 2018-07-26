require "active_support"
require "active_support/core_ext"

require "schema_serializer/definition"
require "schema_serializer/schema"
require "schema_serializer/serializable"
require "schema_serializer/errors"
require "schema_serializer/version"
require "schema_serializer/railtie" if defined?(Rails)

class SchemaSerializer
  attr_reader :object

  class << self
    def definition
      @definition
    end

    def definition=(define)
      define = SchemaSerializer::Definition.new(define) unless define.is_a?(SchemaSerializer::Definition)
      @definition = define
    end
  end

  def initialize(object, options = {})
    @object = object
  end

  def as_json(options = nil)
    schema.serialize(self)
  end

  def schema
    self.class.definition.schema(schema_name)
  end

  def schema_name
    return self.class.name.sub("Serializer", "") if self.class < SchemaSerializer

    object.class.name
  end

  private

    def method_missing(name, *args, &block)
      super unless object.respond_to?(name)

      object.public_send(name, *args, &block)
    end

    def respond_to_missing?(name, include_private = false)
      object.respond_to?(name)
    end
end

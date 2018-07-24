require "active_support"
require "active_support/core_ext"

require "schema_serializer/definition"
require "schema_serializer/schema"
require "schema_serializer/errors"
require "schema_serializer/version"

class SchemaSerializer
  attr_reader :object

  class << self
    def definition
      @definition
    end

    def definition=(define)
      @definition = define
    end
  end

  def initialize(object)
    @object = object
  end

  def as_json
    schema.serialize(self)
  end

  def schema
    self.class.definition.find(schema_name)
  end

  def schema_name
    object.class.to_s
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

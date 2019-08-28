require "active_support"
require "active_support/core_ext"
require "yaml_ext"

require "schema_serializer/definition"
require "schema_serializer/schema"
require "schema_serializer/serializable"
require "schema_serializer/errors"
require "schema_serializer/version"
require "schema_serializer/railtie" if defined?(Rails)

class SchemaSerializer
  attr_reader :object

  class << self
    attr_reader :definition

    def load_definition(path)
      doc = YamlExt.load(path)
      if doc.has_key?("openapi") && Gem::Version.new(doc.fetch("openapi")) >= Gem::Version.new("3.0.0")
        doc = doc.fetch("components").fetch("schemas")
      end

      self.definition = doc
    end

    def definition=(define)
      @definition = define.is_a?(SchemaSerializer::Definition) ? define : SchemaSerializer::Definition.new(define)
    end
  end

  def initialize(object, _options = {})
    @object = object
  end

  def as_json(_options = nil)
    schema.serialize(self)
  end

  def schema
    ::SchemaSerializer.definition.schema(schema_name)
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

    def respond_to_missing?(name, _include_private = false)
      object.respond_to?(name)
    end
end

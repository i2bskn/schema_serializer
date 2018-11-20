require "openapi3_parser"

class SchemaSerializer::Definition
  module FromOpenapi3Parser
    class << self
      def build(document)
        SchemaSerializer::Definition.new(schemas_to_hash(document.components.schemas))
      end

      private

        def schemas_to_hash(schemas)
          schemas.each_with_object({}) {|(name, node), obj|
            obj[name.to_s] = node_to_hash(node)
          }
        end

        def node_to_hash(node)
          obj = { "type" => node.type, "nullable" => node.nullable? }
          case obj["type"]
          when "array"
            obj["items"] = node_to_hash(node.items)
          when obj["object"], nil
            obj["required"] = node.required.node_data
            obj["properties"] = node.properties.each_with_object({}) {|(name, property), properties|
              properties[name.to_s] = node_to_hash(property)
            }
          end
          obj
        end
    end
  end
end

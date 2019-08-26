# Uncomment following if use OpenAPI 3 specification.
# require "schema_serializer/definition/from_openapi3_parser"
# SchemaSerializer.definition = SchemaSerializer::Definition::FromOpenapi3Parser.build(
#   Openapi3Parser.load_file(Rails.root.join("doc/schema.yml"))
# )

SchemaSerializer.load_definition(Rails.root.join("doc/schema.yml"))

# Throw exception with unexpected null value.
SchemaSerializer.config.raise_on_null = true

SchemaSerializer.load_definition(Rails.root.join("doc/schema.yml"))

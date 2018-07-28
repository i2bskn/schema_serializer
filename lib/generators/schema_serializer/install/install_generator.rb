module SchemaSerializer::Generators
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path("templates", __dir__)

    def create_config_file
      copy_file "schema_serializer.rb", "config/initializers/schema_serializer.rb"
    end

    def create_example_schema
      copy_file "schema.yml", "doc/schema.yml"
    end
  end
end

module SchemaSerializer::Generators
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path("templates", __dir__)

    def create_config_file
      copy_file "schema_serializer.rb", "config/initializers/schema_serializer.rb"
    end

    def create_example_schema
      copy_file "schema.yml", "doc/schema.yml"
      copy_file "components/index.yml", "doc/components/index.yml"
      copy_file "components/schemas/index.yml", "doc/components/schemas/index.yml"
      copy_file "components/schemas/User.yml", "doc/components/schemas/User.yml"
      copy_file "components/schemas/Users.yml", "doc/components/schemas/Users.yml"
    end
  end
end

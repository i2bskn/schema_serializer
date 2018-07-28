module SchemaSerializer::Generators
  class SerializerGenerator < Rails::Generators::NamedBase
    source_root File.expand_path("templates", __dir__)

    def create_serializer
      template "serializer.rb.erb", File.join("app/serializers", "#{file_name}_serializer.rb")
    end
  end
end

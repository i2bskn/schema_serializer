class SchemaSerializer
  class Railtie < ::Rails::Railtie
    initializer "schema_serializer" do
      ActiveSupport.on_load(:active_record) do
        ::ActiveRecord::Base.send(:include, SchemaSerializer::Serializable)
      end
    end
  end
end

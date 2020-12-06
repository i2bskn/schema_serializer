class SchemaSerializer
  module Serializable
    def serializer(*args)
      options = args.last.is_a?(Hash) ? args.pop : {}
      klass = args.first || options[:class]
      (klass || serializer_class || SchemaSerializer).new(self, options)
    end

    private

      def serializer_class
        SchemaSerializer::Constantizer.find("#{serializer_base_class_name}Serializer")
      end

      def serializer_base_class_name
        return self.class.name unless defined?(ActiveRecord)

        self.class < ActiveRecord::Relation ? model.name.pluralize : self.class.name
      end
  end
end

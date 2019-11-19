class SchemaSerializer
  module Serializable
    def serializer(*args)
      options = args.last.is_a?(Hash) ? args.pop : {}
      klass = args.first || options[:class]
      (klass || serializer_class || SchemaSerializer).new(self, options)
    end

    private

      def serializer_class
        "#{serializer_base_class_name}Serializer".safe_constantize
      end

      def serializer_base_class_name
        self.class < ActiveRecord::Relation ? self.model.name.pluralize : self.class.name
      end
  end
end

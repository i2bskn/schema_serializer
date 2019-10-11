class SchemaSerializer
  module Serializable
    def serializer(*args)
      options = args.last.is_a?(Hash) ? args.pop : {}
      klass = args.first || options[:class]
      (klass || "#{self.class.name}Serializer".safe_constantize || SchemaSerializer).new(self, options)
    end
  end
end

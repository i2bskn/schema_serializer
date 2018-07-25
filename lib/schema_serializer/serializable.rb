class SchemaSerializer
  module Serializable
    def serializer(klass = nil)
      (klass || "#{self.class.name}Serializer".safe_constantize || SchemaSerializer).new(self)
    end
  end
end

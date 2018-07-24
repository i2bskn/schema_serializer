class SchemaSerializer
  module Serializable
    def serializer(klass = nil)
      (klass || "#{self.class.to_s}Serializer".safe_constantize || SchemaSerializer).new(self)
    end
  end
end

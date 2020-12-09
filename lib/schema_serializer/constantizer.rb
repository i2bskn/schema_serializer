class SchemaSerializer
  class Constantizer
    class << self
      def find(name)
        return cached_serializers.fetch(name) if cached_serializers.has_key?(name)
        return nil                            if non_existent_serializers.include?(name)

        klass = name.safe_constantize
        if klass.present?
          cached_serializers[name] = klass
          return klass
        end

        non_existent_serializers << name
        nil
      end

      def refresh!
        @non_existent_serializers = []
        @serializers = {}
      end

      private

        def non_existent_serializers
          @non_existent_serializers ||= []
        end

        def cached_serializers
          @cached_serializers ||= {}
        end
    end
  end
end

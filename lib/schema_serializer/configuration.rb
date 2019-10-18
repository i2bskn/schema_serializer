class SchemaSerializer
  class Configuration
    VALID_OPTIONS = [
      :raise_on_null,
    ].freeze

    attr_accessor(*VALID_OPTIONS)

    def initialize(options = {})
      reset
      merge(options)
    end

    def merge(options)
      options.keys.each { |key| send("#{key}=", options[key]) }
      self
    end

    def reset
      @raise_on_null = true
    end
  end
end

class SchemaSerializer
  class BaseError          < StandardError; end
  class SchemaNotFound     < BaseError; end
  class RequiredNotDefined < BaseError; end
end

require "test_helper"

class SchemaSerializerTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::SchemaSerializer::VERSION
  end
end

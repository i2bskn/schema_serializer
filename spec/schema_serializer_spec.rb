require "spec_helper"

RSpec.describe SchemaSerializer do
  it "has a version number" do
    expect(SchemaSerializer::VERSION).not_to be nil
  end

  it "defined BaseError" do
    expect(SchemaSerializer::BaseError).not_to be nil
  end

  it "defined SchemaNotFound" do
    expect(SchemaSerializer::SchemaNotFound).not_to be nil
  end

  it "defined RequiredNotDefined" do
    expect(SchemaSerializer::RequiredNotDefined).not_to be nil
  end
end

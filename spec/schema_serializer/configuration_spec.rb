require "spec_helper"

RSpec.describe SchemaSerializer::Configuration do
  let(:config) { SchemaSerializer.config }

  it { expect(config).to be_a_kind_of(SchemaSerializer::Configuration) }
  it { expect(config.raise_on_null).to be_truthy }

  context "custom configurations" do
    before do
      SchemaSerializer.config.raise_on_null = false
    end

    it { expect(config.raise_on_null).to be_falsey }
  end
end

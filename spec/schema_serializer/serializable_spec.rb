require "spec_helper"

RSpec.describe SchemaSerializer::Serializable do
  before do
    class Item
      include SchemaSerializer::Serializable
    end

    class ExampleSerializer < SchemaSerializer; end
  end

  after do
    Object.send(:remove_const, :Item)
    Object.send(:remove_const, :ExampleSerializer)
  end

  let(:item) { Item.new }

  subject { item.serializer }

  context "load default serializer" do
    it { is_expected.to be_a(SchemaSerializer) }
  end

  context "load specific serializer" do
    subject { item.serializer(ExampleSerializer) }

    it { is_expected.to be_a(ExampleSerializer) }
  end

  context "load named serializer" do
    before do
      class ItemSerializer < SchemaSerializer; end
    end

    after do
      Object.send(:remove_const, :ItemSerializer)
    end

    it { is_expected.to be_a(ItemSerializer) }
  end
end

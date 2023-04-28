require "rails_helper"
require "administrate/field/rich_text"
require "support/field_matchers"
#require "actiontext/rendering"
require "active_storage/engine"
require "action_text/engine"
require 'rails/all'
#require "action_text/rich_text"
require "action_text/fixture_set"
require "active_support/core_ext/module/attribute_accessors_per_thread"
require "active_support/core_ext/big_decimal/conversions"

describe Administrate::Field::RichText do
  include FieldMatchers
  include ActionText::RichText

  it do
    should_permit_param(
      "foo",
      on_model: Customer,
      for_attribute: :foo,
    )
  end

  describe "#to_partial_path" do
    it "returns a partial based on the page being rendered" do
      page = :show
      action_text = ::ActionText::RichText.new(body: "<trix><p>Foo</p></trix>")
      field = Administrate::Field::RichText.new(:document, action_text, page)

      path = field.to_partial_path

      expect(path).to eq("/fields/rich_text/#{page}")
    end
  end

  describe "#to_s" do
    it "displays plain body text" do
      action_text = ::ActionText::RichText.new(body: "<trix><p>Foo</p></trix>")
      rich_text = Administrate::Field::RichText.new(:document, action_text, :show)

      expect(rich_text.to_s).to eq("Foo")
    end

    context "when data is nil" do
      it "is an empty string" do
        rich_text = Administrate::Field::RichText.new(:document, nil, :page)

        expect(rich_text.to_s).to eq("")
      end
    end
  end
end

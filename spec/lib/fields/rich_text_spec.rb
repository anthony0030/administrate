require "rails_helper"
require "administrate/field/rich_text"
require "support/field_matchers"
#require "actiontext/rendering"
require "active_storage/engine"
require "action_text" #/engine"
#require 'rails/all'
require "action_text/fixture_set"
require "active_support/core_ext/module/attribute_accessors_per_thread"
require "active_support/core_ext/big_decimal/conversions"
#require "action_text/railtie"

#require "action_text/attachable"
#require "action_text/attachables/content_attachment"
#require "action_text/attachables/missing_attachable"
#require "action_text/attachables/remote_image"
#require "action_text/attachment"
#require "action_text/attachment_gallery"
#require "action_text/attachments/caching"
#require "action_text/attachments/minification"
#require "action_text/attachments/trix_conversion"
#require "action_text/attribute"
#require "action_text/content"
#require "action_text/encryption"
#require "action_text/engine"
#require "action_text/fixture_set"
#require "action_text/fragment"
#require "action_text/gem_version"
#require "action_text/html_conversion"
#require "action_text/plain_text_conversion"
#require "action_text/rendering"
#require "action_text/serialization"
#require "action_text/system_test_helper"
#require "action_text/trix_attachment"
#require "action_text/version"

describe Administrate::Field::RichText do
  include FieldMatchers
#  include ActionText::RichText

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
      foo = ActiveRecord::SchemaMigration.new
#      foo = ActiveStorage::Blob.new
      action_text = ::ActionText::RichText.new(body: "<trix><p>Foo</p></trix>")
      action_text = "boo"
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

require "rails_helper"
require "administrate/field/base"
require "administrate/field/rich_text"

describe "fields/rich_text/_form", type: :view do
  it "provides the correct name for the field" do
    stub_const("ProductDashbard::ATTRIBUTE_TYPES", {
      foo: Administrate::Field::RichText
    })
    product = build(:product, name: nil)
    foo = instance_double(
      "Administrate::Field::RichText",
      attribute: :foo,
      data: nil,
    )

    render(
      partial: "fields/rich_text/form",
      locals: { field: foo, f: form_builder(product) },
    )

    expect(rendered).to have_css(%{input[name="product[foo]"]})
  end

  it "displays the resource name" do
    stub_const("ProductDashbard::ATTRIBUTE_TYPES", {
      foo: Administrate::Field::RichText
    })
    product = build(:product, foo: nil)
    rich_text = instance_double(
      "Administrate::Field::RichText",
      attribute: "Foo",
      data: nil,
      name: "foo",
    )

    render(
      partial: "fields/rich_text/form",
      locals: { field: rich_text, f: form_builder(product) },
    )

    expect(rendered.strip).to include("Foo")
  end

  def form_builder(object)
    ActionView::Helpers::FormBuilder.new(
      object.model_name.singular,
      object,
      build_template,
      {},
    )
  end

  def build_template
    Object.new.tap do |template|
      template.extend ActionView::Helpers::FormHelper
      template.extend ActionView::Helpers::FormOptionsHelper
      template.extend ActionView::Helpers::FormTagHelper
    end
  end
end

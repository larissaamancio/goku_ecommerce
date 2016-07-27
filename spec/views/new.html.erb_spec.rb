require 'spec_helper'

describe "customers/new" do
  before(:each) do
    assign(:customer, stub_model(Customer,
      :name => "Thiago",
      :zip_code => "03977406"
    ).as_new_record)
  end

  it "renders new customer form" do
    render

    assert_select "form[action=?][method=?]", customers_path, "post" do
    assert_select "input#customer_name[name=?]", "customer[name]"
    assert_select "input#customer_zip_code[name=?]", "customer[zip_code]"
    end
  end
end
require 'rails_helper'

RSpec.describe "composts/edit", type: :view do
  before(:each) do
    @compost = assign(:compost, Compost.create!(
      :title => "MyString",
      :address => "MyString",
      :zipcode => "MyString",
      :city => "MyString",
      :country => "MyString",
      :description => "MyText",
      :access_data => "MyText",
      :image_url => "MyString",
      :is_open => false,
      :filling => 1
    ))
  end

  it "renders the edit compost form" do
    render

    assert_select "form[action=?][method=?]", compost_path(@compost), "post" do

      assert_select "input[name=?]", "compost[title]"

      assert_select "input[name=?]", "compost[address]"

      assert_select "input[name=?]", "compost[zipcode]"

      assert_select "input[name=?]", "compost[city]"

      assert_select "input[name=?]", "compost[country]"

      assert_select "textarea[name=?]", "compost[description]"

      assert_select "textarea[name=?]", "compost[access_data]"

      assert_select "input[name=?]", "compost[image_url]"

      assert_select "input[name=?]", "compost[is_open]"

      assert_select "input[name=?]", "compost[filling]"
    end
  end
end

require 'rails_helper'

RSpec.describe "composts/index", type: :view do
  before(:each) do
    assign(:composts, [
      Compost.create!(
        :title => "Title",
        :address => "Address",
        :zipcode => "Zipcode",
        :city => "City",
        :country => "Country",
        :description => "MyText",
        :access_data => "MyText",
        :image_url => "Image Url",
        :is_open => false,
        :filling => 2
      ),
      Compost.create!(
        :title => "Title",
        :address => "Address",
        :zipcode => "Zipcode",
        :city => "City",
        :country => "Country",
        :description => "MyText",
        :access_data => "MyText",
        :image_url => "Image Url",
        :is_open => false,
        :filling => 2
      )
    ])
  end

  it "renders a list of composts" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "Zipcode".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "Country".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Image Url".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end

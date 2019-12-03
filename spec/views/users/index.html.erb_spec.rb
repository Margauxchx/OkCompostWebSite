require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :firstname => "Firstname",
        :lastname => "Lastname",
        :username => "Username",
        :email => "Email",
        :address => "Address",
        :zipcode => "Zipcode",
        :city => "City",
        :country => "Country",
        :avatar_url => "Avatar Url",
        :is_composter => false
      ),
      User.create!(
        :firstname => "Firstname",
        :lastname => "Lastname",
        :username => "Username",
        :email => "Email",
        :address => "Address",
        :zipcode => "Zipcode",
        :city => "City",
        :country => "Country",
        :avatar_url => "Avatar Url",
        :is_composter => false
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "Firstname".to_s, :count => 2
    assert_select "tr>td", :text => "Lastname".to_s, :count => 2
    assert_select "tr>td", :text => "Username".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "Zipcode".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "Country".to_s, :count => 2
    assert_select "tr>td", :text => "Avatar Url".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end

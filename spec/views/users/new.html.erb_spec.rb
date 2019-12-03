require 'rails_helper'

RSpec.describe "users/new", type: :view do
  before(:each) do
    assign(:user, User.new(
      :firstname => "MyString",
      :lastname => "MyString",
      :username => "MyString",
      :email => "MyString",
      :address => "MyString",
      :zipcode => "MyString",
      :city => "MyString",
      :country => "MyString",
      :avatar_url => "MyString",
      :is_composter => false
    ))
  end

  it "renders new user form" do
    render

    assert_select "form[action=?][method=?]", users_path, "post" do

      assert_select "input[name=?]", "user[firstname]"

      assert_select "input[name=?]", "user[lastname]"

      assert_select "input[name=?]", "user[username]"

      assert_select "input[name=?]", "user[email]"

      assert_select "input[name=?]", "user[address]"

      assert_select "input[name=?]", "user[zipcode]"

      assert_select "input[name=?]", "user[city]"

      assert_select "input[name=?]", "user[country]"

      assert_select "input[name=?]", "user[avatar_url]"

      assert_select "input[name=?]", "user[is_composter]"
    end
  end
end

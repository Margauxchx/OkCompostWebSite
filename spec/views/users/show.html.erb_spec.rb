require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Firstname/)
    expect(rendered).to match(/Lastname/)
    expect(rendered).to match(/Username/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/Zipcode/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/Country/)
    expect(rendered).to match(/Avatar Url/)
    expect(rendered).to match(/false/)
  end
end

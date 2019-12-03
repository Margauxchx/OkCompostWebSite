require 'rails_helper'

RSpec.describe "composts/show", type: :view do
  before(:each) do
    @compost = assign(:compost, Compost.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/Zipcode/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/Country/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Image Url/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/2/)
  end
end

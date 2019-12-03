FactoryBot.define do
  factory :compost do
    title { "MyString" }
    address { "MyString" }
    zipcode { "MyString" }
    city { "MyString" }
    country { "MyString" }
    description { "MyText" }
    access_data { "MyText" }
    image_url { "MyString" }
    is_open { false }
    filling { 1 }
  end
end

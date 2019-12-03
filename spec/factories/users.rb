FactoryBot.define do
  factory :user do
    firstname { "MyString" }
    lastname { "MyString" }
    username { "MyString" }
    email { "MyString" }
    address { "MyString" }
    zipcode { "MyString" }
    city { "MyString" }
    country { "MyString" }
    avatar_url { "MyString" }
    is_composter { false }
  end
end

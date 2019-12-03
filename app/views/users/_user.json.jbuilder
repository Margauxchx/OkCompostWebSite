json.extract! user, :id, :firstname, :lastname, :username, :email, :address, :zipcode, :city, :country, :avatar_url, :is_composter, :created_at, :updated_at
json.url user_url(user, format: :json)

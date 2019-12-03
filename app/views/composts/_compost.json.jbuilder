json.extract! compost, :id, :title, :address, :zipcode, :city, :country, :description, :access_data, :image_url, :is_open, :filling, :created_at, :updated_at
json.url compost_url(compost, format: :json)

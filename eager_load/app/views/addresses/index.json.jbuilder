json.array!(@addresses) do |address|
  json.extract! address, :id, :user_id, :country, :city, :postal_code
  json.url address_url(address, format: :json)
end

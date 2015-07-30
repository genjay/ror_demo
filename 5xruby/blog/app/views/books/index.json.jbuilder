json.array!(@books) do |book|
  json.extract! book, :id, :name, :memo
  json.url book_url(book, format: :json)
end

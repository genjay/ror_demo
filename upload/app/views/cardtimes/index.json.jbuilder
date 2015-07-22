json.array!(@cardtimes) do |cardtime|
  json.extract! cardtime, :id, :ou_id, :cardno, :cardtime, :up_data
  json.url cardtime_url(cardtime, format: :json)
end

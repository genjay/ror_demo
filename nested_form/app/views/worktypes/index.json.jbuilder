json.array!(@worktypes) do |worktype|
  json.extract! worktype, :id, :uid, :name, :begin_at, :end_at
  json.url worktype_url(worktype, format: :json)
end

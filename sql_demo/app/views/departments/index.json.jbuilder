json.array!(@departments) do |department|
  json.extract! department, :id, :uid, :name, :employees_count
  json.url department_url(department, format: :json)
end

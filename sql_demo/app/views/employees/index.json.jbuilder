json.array!(@employees) do |employee|
  json.extract! employee, :id, :uid, :name, :department_id
  json.url employee_url(employee, format: :json)
end

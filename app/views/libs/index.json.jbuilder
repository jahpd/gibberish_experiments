json.array!(@libs) do |lib|
  json.extract! lib, :id, :name, :author, :code, :created_at
  json.url lib_url(lib, format: :json)
end

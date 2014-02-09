json.array!(@helps) do |help|
  json.extract! help, :id, :title, :body, :created_at
  json.url help_url(help, format: :json)
end

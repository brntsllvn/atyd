json.array!(@comics) do |comic|
  json.extract! comic, :id, :title, :release_date
  json.url comic_url(comic, format: :json)
end

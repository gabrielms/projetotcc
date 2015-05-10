json.array!(@pupils) do |pupil|
  json.extract! pupil, :id, :name
  json.url pupil_url(pupil, format: :json)
end

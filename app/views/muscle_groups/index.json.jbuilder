json.array!(@muscle_groups) do |muscle_group|
  json.extract! muscle_group, :id, :name
  json.url muscle_group_url(muscle_group, format: :json)
end

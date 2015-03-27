json.array!(@coaches) do |coach|
  json.extract! coach, :id, :user_id, :name, :cref, :phone
  json.url coach_url(coach, format: :json)
end

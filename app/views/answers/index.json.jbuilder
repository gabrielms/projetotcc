json.array!(@answers) do |answer|
  json.extract! answer, :id, :coach_id, :workout_id, :value
  json.url answer_url(answer, format: :json)
end

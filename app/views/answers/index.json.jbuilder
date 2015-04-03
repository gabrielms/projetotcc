json.array!(@answers) do |answer|
  json.extract! answer, :id, :reply_id, :question_id, :possible_answer_id, :value
  json.url answer_url(answer, format: :json)
end

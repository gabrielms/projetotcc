json.array!(@replies) do |reply|
  json.extract! reply, :id, :poll_id
  json.url reply_url(reply, format: :json)
end

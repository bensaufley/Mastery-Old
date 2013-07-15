json.array!(@instances) do |instance|
  json.extract! instance, :activity_id, :when, :until, :private
  json.url instance_url(instance, format: :json)
end
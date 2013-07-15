json.array!(@activities) do |activity|
  json.extract! activity, :user_id, :name, :private, :tracking_type
  json.url activity_url(activity, format: :json)
end
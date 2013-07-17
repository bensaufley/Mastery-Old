json.array!(@activities) do |activity|
  json.extract! activity, user: activity.user, :name, :private, :tracking_type
  json.url activity_url(activity, format: :json)
end
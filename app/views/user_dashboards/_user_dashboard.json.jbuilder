json.extract! user_dashboard, :id, :created_at, :updated_at
json.url user_dashboard_url(user_dashboard, format: :json)

json.extract! reservation, :id, :seat, :day, :function_id, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)

json.extract! movie, :id, :name, :photo, :initialDate, :finalDate, :created_at, :updated_at
json.url movie_url(movie, format: :json)

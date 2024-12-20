json.extract! game, :id, :name, :description, :publisher, :price, :created_at, :updated_at
json.url game_url(game, format: :json)

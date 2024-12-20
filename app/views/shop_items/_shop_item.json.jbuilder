json.extract! shop_item, :id, :name, :description, :amount, :price, :created_at, :updated_at
json.url shop_item_url(shop_item, format: :json)

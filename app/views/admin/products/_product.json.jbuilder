json.extract! product, :id, :name, :description, :price, :minimum_price, :minimum_quantity, :facebook_link, :instagram_link, :category_id, :created_at, :updated_at
json.url product_url(product, format: :json)

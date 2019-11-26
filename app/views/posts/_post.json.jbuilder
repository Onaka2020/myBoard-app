json.extract! post, :id, :contributor, :content, :post_number, :created_at, :updated_at
json.url post_url(post, format: :json)

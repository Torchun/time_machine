json.extract! items_hist, :id, :items_id, :f1, :f2, :f3, :items_created_at, :items_updated_at, :op_hist, :created_at, :updated_at
json.url items_hist_url(items_hist, format: :json)

json.extract! order, :id, :hospital_id, :bank_id, :blood_type, :amount, :completed, :created_at, :updated_at
json.url order_url(order, format: :json)

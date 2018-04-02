# frozen_string_literal: true

json.extract! developer, :id, :email, :created_at, :updated_at
json.url developer_url(developer, format: :json)

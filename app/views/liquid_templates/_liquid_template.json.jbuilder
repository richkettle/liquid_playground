json.extract! liquid_template, :id, :label, :body, :created_at, :updated_at
json.url liquid_template_url(liquid_template, format: :json)

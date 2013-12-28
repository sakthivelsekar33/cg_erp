json.array!(@colleges) do |college|
  json.extract! college, :id, :name, :code, :address_line_one, :address_line_two, :zip, :sub_domain
  json.url college_url(college, format: :json)
end

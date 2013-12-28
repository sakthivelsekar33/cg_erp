json.array!(@students) do |student|
  json.extract! student, :id, :name, :code, :address_line_one, :address_line_two, :zip
  json.url student_url(student, format: :json)
end

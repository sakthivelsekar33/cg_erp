module SchemaUtils
	def self.add_schema_to_path(schema)
		search_paths = [schema, 'public'].compact
		ActiveRecord::Base.connection.schema_search_path = search_paths.join(",")
	end


	def self.reset_search_path
		ActiveRecord::Base.connection.schema_search_path = %{public}
	end

end
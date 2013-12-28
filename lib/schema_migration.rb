module SchemaMigration

	def self.get_migration_schemas
		ActiveRecord::Base.connection.select_values <<-END
      SELECT * FROM pg_namespace WHERE
        nspname NOT IN ('information_schema', 'public') AND
        nspname NOT LIKE 'pg%'
      END
	end

	def self.run_migration(schemas)
		schemas.each do |schema|
    	ActiveRecord::Base.connection.schema_search_path = schema	
    	ActiveRecord::Migration.verbose = ENV["VERBOSE"] ? ENV["VERBOSE"] == "true" : true
    	ActiveRecord::Migrator.migrate("db/schema_migrate", ENV["VERSION"] ? ENV["VERSION"].to_i : nil)
    end
    SchemaUtils.reset_search_path
	end

end
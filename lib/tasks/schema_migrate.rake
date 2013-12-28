namespace :db do
  
  task :schema_migrate => :environment do

  	schemas = get_schema_names

    schemas.each do |schema|
    	ActiveRecord::Base.connection.schema_search_path = schema	
    	ActiveRecord::Migration.verbose = ENV["VERBOSE"] ? ENV["VERBOSE"] == "true" : true
    	ActiveRecord::Migrator.migrate("db/schema_migrate", ENV["VERSION"] ? ENV["VERSION"].to_i : nil)
    	Rake::Task["db:schema:dump"].invoke if ActiveRecord::Base.schema_format == :ruby
    end
    SchemaUtils.reset_search_path
  end


  task :schema_rollback => :environment do
    schemas = get_schema_names
    schemas.each do |schema|
      ActiveRecord::Base.connection.schema_search_path = schema
      step = ENV['STEP'] ? ENV['STEP'].to_i : 1
      ActiveRecord::Migrator.rollback("db/schema_migrate", step)
      Rake::Task["db:schema:dump"].invoke if ActiveRecord::Base.schema_format == :ruby
    end
    SchemaUtils.reset_search_path
  end


  def get_schema_names
    ActiveRecord::Base.connection.select_values <<-END
      SELECT *
      FROM pg_namespace
      WHERE
        nspname NOT IN ('information_schema', 'public') AND
        nspname NOT LIKE 'pg%'
      END
  end

end
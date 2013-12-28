class College < ActiveRecord::Base

	after_create :set_up_default_structure


	def set_up_default_structure
		binding.pry
    ActiveRecord::Base.connection.execute "CREATE SCHEMA #{sub_domain}"
    SchemaMigration.run_migration([sub_domain])
	end

end


class CreateColleges < ActiveRecord::Migration
  def change
    create_table :colleges do |t|
      t.string :name
      t.string :code
      t.string :address_line_one
      t.string :address_line_two
      t.integer :zip
      t.string :sub_domain

      t.timestamps
    end
  end
end

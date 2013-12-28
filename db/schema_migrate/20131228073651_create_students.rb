class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :code
      t.string :address_line_one
      t.string :address_line_two
      t.integer :zip

      t.timestamps
    end
  end
end

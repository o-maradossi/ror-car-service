class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.float :budget
      t.belongs_to :dealership
      t.belongs_to :salesman

      t.timestamps null: false
    end
  end
end

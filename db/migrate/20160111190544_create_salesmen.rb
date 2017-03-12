class CreateSalesmen < ActiveRecord::Migration
  def change
    create_table :salesmen do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.integer :license_number
      t.belongs_to :dealership

      t.timestamps null: false
    end
  end
end

class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :make
      t.string :model
      t.integer :year
      t.integer :mileage
      t.string :condition
      t.string :color
      t.belongs_to :dealership
      t.belongs_to :salesman
      t.belongs_to :customer

      t.timestamps null: false
    end
  end
end

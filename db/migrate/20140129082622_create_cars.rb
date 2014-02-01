class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :make
      t.string :model
      t.integer :year
      t.integer :seats
      t.string :transmission
      t.string :drive
      t.string :interior
      t.string :exterior

      t.timestamps
    end
  end
end

class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :customer
      t.text :body
      t.string :car

      t.timestamps
    end
  end
end

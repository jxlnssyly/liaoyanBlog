class CreateFoods < ActiveRecord::Migration[5.1]
  def change
    create_table :foods do |t|
      t.string :restaurant
      t.integer :star
      t.integer :average_price
      t.string :foodtype
      t.string :addr
      t.float :taste
      t.float :environment
      t.float :service

      t.timestamps
    end
    add_index :foods, :star
    add_index :foods, :foodtype
    add_index :foods, :average_price
    add_index :foods, [:restaurant,:addr], unique: true
  end
end

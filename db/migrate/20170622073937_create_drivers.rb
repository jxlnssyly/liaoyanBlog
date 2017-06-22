class CreateDrivers < ActiveRecord::Migration[5.1]
  def change
    create_table :drivers do |t|
      t.string :src
      t.string :title

      t.timestamps
    end
  end
end

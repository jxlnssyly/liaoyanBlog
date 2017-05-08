class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :keyword
      t.text :content
      t.string :name

      t.timestamps
    end
  end
end

class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.string :name, null: false
      t.integer :genre_id, null: false 
      t.integer :customer_id, null: false
      t.string :description, null: false
      t.string :tips, null: false
      t.string :point, null: false
      t.boolean :is_status, null: false, default: true
      t.string :drink, null: false
      t.string :drink_point, null: false
      t.timestamps
    end
  end
end

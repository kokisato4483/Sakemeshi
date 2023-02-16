class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.string :tips, null: false
      t.string :point, null: false
      t.boolean :is_status, null: false
      t.string :drink, null: false, default: true
      t.string :drink_point, null: false
      t.timestamps
    end
  end
end

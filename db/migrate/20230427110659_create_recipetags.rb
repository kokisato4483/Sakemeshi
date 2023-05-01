class CreateRecipetags < ActiveRecord::Migration[6.1]
  def change
    create_table :recipetags do |t|
      t.string :name
      t.timestamps
    end
  end
end

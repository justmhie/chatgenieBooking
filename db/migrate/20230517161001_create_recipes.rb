class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :image
      t.text :ingredients
      t.text :instructions
      t.references :cuisine
      t.timestamps
    end
  end
end

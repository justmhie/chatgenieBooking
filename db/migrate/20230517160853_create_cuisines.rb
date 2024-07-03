class CreateCuisines < ActiveRecord::Migration[7.0]
  def change
    create_table :cuisines do |t|
      t.string :region
      t.string :image
      t.timestamps
    end
  end
end

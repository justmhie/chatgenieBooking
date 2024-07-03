class CreateRoomTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :room_types do |t|
      t.references :hotel, null: false, foreign_key: true
      t.string :name, null: false
      t.text :description
      t.integer :capacity
      t.decimal :price_per_night, precision: 8, scale: 2

      t.timestamps
    end
  end
end

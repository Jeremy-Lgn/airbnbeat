class CreateInstruments < ActiveRecord::Migration[7.1]
  def change
    create_table :instruments do |t|
      t.string :title
      t.string :brand
      t.string :model
      t.string :description
      t.references :category, null: false, foreign_key: true
      t.float :price_per_day
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

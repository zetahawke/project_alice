class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.integer :price
      t.integer :minimum_price
      t.integer :minimum_quantity
      t.string :facebook_link
      t.string :instagram_link
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end

# This migration comes from app (originally 20260129225358)
class CreateAppProducts < ActiveRecord::Migration[8.1]
  def change
    create_table :app_products do |t|
      t.string :product, null: false, index: { unique: true }
      t.decimal :price, precision: 8, scale: 2, null: false
      t.boolean :active, null: false, default: false
      t.text :description, null: true

      t.belongs_to :app_company, null: false, foreign_key: true

      t.timestamps
    end
  end
end

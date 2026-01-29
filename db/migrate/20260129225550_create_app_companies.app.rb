# This migration comes from app (originally 20260129225050)
class CreateAppCompanies < ActiveRecord::Migration[8.1]
  def change
    create_table :app_companies do |t|
      t.string :company, null: false, index: { unique: true }
      t.boolean :active, null: false, default: false

      t.timestamps
    end
  end
end

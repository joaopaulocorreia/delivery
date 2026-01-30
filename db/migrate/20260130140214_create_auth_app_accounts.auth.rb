# This migration comes from auth (originally 20260130135747)
class CreateAuthAppAccounts < ActiveRecord::Migration[8.1]
  def change
    create_table :auth_app_accounts do |t|
      t.string :name, null: false
      t.boolean :active, null: false, default: false

      t.belongs_to :auth_user, foreign_key: true
      t.belongs_to :app_company, foreign_key: true

      t.index %i[auth_user_id app_company_id], unique: true

      t.timestamps
    end
  end
end

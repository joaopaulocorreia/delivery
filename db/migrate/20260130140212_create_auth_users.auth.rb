# This migration comes from auth (originally 20260129225050)
class CreateAuthUsers < ActiveRecord::Migration[8.1]
  def change
    create_table :auth_users do |t|
      t.string :email, null: false, index: { unique: true }
      t.string :password_digest, null: false
      t.boolean :active, null: false, default: false

      t.timestamps
    end
  end
end

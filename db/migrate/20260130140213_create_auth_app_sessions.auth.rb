# This migration comes from auth (originally 20260129225358)
class CreateAuthAppSessions < ActiveRecord::Migration[8.1]
  def change
    create_table :auth_sessions do |t|
      t.string :user_agent
      t.string :ip_address

      t.belongs_to :auth_user, foreign_key: true
      t.belongs_to :app_company, foreign_key: true

      t.timestamps
    end
  end
end

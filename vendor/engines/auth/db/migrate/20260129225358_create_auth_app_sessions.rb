class CreateAuthAppSessions < ActiveRecord::Migration[8.1]
  def change
    create_table :auth_app_sessions do |t|
      t.string :user_agent
      t.string :ip_address

      t.belongs_to :user, foreign_key: { to_table: "auth_users" }
      t.belongs_to :app_company, foreign_key: { to_table: "app_companies" }

      t.timestamps
    end
  end
end

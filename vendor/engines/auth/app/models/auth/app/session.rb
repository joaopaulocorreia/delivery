module Auth
  module App
    class Session < ApplicationRecord
      self.table_name = "auth_app_sessions"

      belongs_to :user, class_name: "Auth::User"
      belongs_to :app_company, class_name: "App::Company", required: false
    end
  end
end

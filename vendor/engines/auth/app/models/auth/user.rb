module Auth
  class User < ApplicationRecord
    has_secure_password

    has_many :app_sessions, class_name: "Auth::App::Session", dependent: :destroy

    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :password, length: { minimum: 12 }

    normalizes :email, with: -> { _1.strip.downcase }
  end
end

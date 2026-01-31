module Auth
  class SignInController < ApplicationController
    allow_unauthenticated_access only: %i[ new create ]

    rate_limit to: 10, within: 3.minutes, only: :create, with: -> { redirect_to new_sign_in_path, alert: "Try again later." }

    def new
      @sign_in_form = SignInForm.new
    end

    def create
      result = auth_service.call(**sign_in_params)
      matcher.call(result) do |m|
        m.success do
          ap "OKOKOKOK"
        end

        m.failure :sign_in_form_error do |sign_in_form|
          @sign_in_form = sign_in_form
          render :new, status: :unprocessable_entity
        end

        m.failure(:incorrect_email_or_password) { redirect_to new_sign_in_path, alert: "Try another email or password" }
      end
    end

    private

    def sign_in_params = { email: params[:email], password: params[:password] }

    def auth_service = Services::Operations::User::Authenticate.new

    def session_create_service
      params[:target] == "backoffice" ? Services::Operations::Backoffice::Session::Create.new : Services::Operations::App::Session::Create.new
    end

    def after_authentication_url
      params[:target] == "backoffice" ? backoffice_root_path : app_root_path
    end
  end
end

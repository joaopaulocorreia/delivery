module Auth
  class SignInController < ApplicationController
    allow_unauthenticated_access only: %i[ new create ]

    rate_limit to: 10, within: 3.minutes, only: :create, with: -> { redirect_to new_sign_in_path, alert: "Try again later." }

    def new
      @sign_in_form = SignInForm.new
    end

    def create
      case auth_service.call(**sign_in_params)
      in Dry::Monads::Success[ user ]
        case session_create_service.call(user)
        in Dry::Monads::Success
          redirect_to redirect_to_target, alert: "SESSÂO CRIADA"
        in Dry::Monads::Failure
          redirect_to new_sign_in_path, alert: "ERRO AO CRIAR SESSÂO"
        end
      in Dry::Monads::Failure[ :sign_in_form_error, sign_in_form ]
        @sign_in_form = sign_in_form
        render :new, status: :unprocessable_entity
      in Dry::Monads::Failure[ :incorrect_email_or_password ]
        redirect_to new_sign_in_path, alert: "Try another email or password"
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

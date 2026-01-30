module Auth
  module Services
    module Operations
      module User
        class Authenticate < ApplicationService
          def call(email:, password:)
            form = step validate_form(email:, password:)
            step authenticate_user(email: form.email, password: form.password)
          end

          private

          def validate_form(...)
            sign_in_form = SignInForm.new(...)

            if sign_in_form.valid?
              Success sign_in_form
            else
              Failure [ :sign_in_form_error, sign_in_form ]
            end
          end

          def authenticate_user(...)
            user = Auth::User.authenticate_by(...)

            if user
              Success user
            else
              Failure :incorrect_email_or_password
            end
          end
        end
      end
    end
  end
end

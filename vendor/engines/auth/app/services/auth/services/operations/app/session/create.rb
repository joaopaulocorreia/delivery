module Auth
  module Services
    module Operations
      module App
        module Session
          class Create < ApplicationService
            def call(user_or_id)
              user = step find(user_or_id, Auth::User, error_message: :user_not_found)

              session_params[:auth_user] = user
              session = step create(Auth::App::Session)

              session
            end
          end
        end
      end
    end
  end
end

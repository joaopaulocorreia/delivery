Auth::Engine.routes.draw do
  root "sign_in#new"

  get "sign_in", to: "sign_in#new", as: :new_sign_in
  post "sign_in", to: "sign_in#create", as: :sign_in

  # get  "sign_up", to: "registrations#new"
  # post "sign_up", to: "registrations#create"

  resource :password, only: [ :new ]
end

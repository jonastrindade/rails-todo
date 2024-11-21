Rails.application.routes.draw do
  devise_for :users

  get "up" => "rails/health#show", as: :rails_health_check

  root "welcomes#index"

  namespace :products do
    namespace :todo do
      resources :tasks
    end
  end

  # keep this route at the EOF
  match "*unmatched", to: "application#not_found", via: :all
end

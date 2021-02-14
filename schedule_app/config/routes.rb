Rails.application.routes.draw do
  resources :rooms do
    collection { post :import }
  end
  resources :schedules
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "dashboard#index"
end

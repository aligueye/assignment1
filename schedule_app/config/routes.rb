Rails.application.routes.draw do
  resources :rooms do
    collection do 
      post :import
      get :search
    end
  end
  resources :schedules do 
    collection do
      post :import
      get :search
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "dashboard#index"
end

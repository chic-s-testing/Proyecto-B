Rails.application.routes.draw do

  resources :movies do
    resources :functions do
      resources :reservations
    end
  end

  root 'pages#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

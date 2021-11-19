Rails.application.routes.draw do
  get 'users/profile'
  devise_for :users, controllers: {
        registrations: 'users/registrations'
      }
  root to: 'pages#home'
  resources :travels do
    member do
      get :seats
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

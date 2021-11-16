Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :spaces do
    resources :bookings, only: [:index, :new, :create, :edit, :update]
  end

  get '/my_spaces', to: 'pages#my_spaces'
end
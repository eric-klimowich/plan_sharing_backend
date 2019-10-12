Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show, :create]
      resources :subjects, only: [:create]
      resources :lessons, only: [:index, :create]
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      get '/logged_in_user', to: 'users#logged_in_user'
    end
  end
end

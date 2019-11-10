Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show, :create]
      resources :grades, only: [:create]
      resources :user_grades, only: [:create]
      resources :subjects, only: [:create]
      resources :user_grade_subjects, only: [:create]
      resources :lessons, only: [:index, :show, :create, :update, :destroy]
      resources :favorite_lessons, only: [:index, :create, :destroy]
      resources :comments, only: [:create]
      resources :requests, only: [:create]
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      get '/logged_in_user', to: 'users#logged_in_user'
      get '/my_lessons', to: 'lessons#my_lessons'
      get '/send_lesson_data/:id', to: 'lessons#send_lesson_data'
    end
  end
end

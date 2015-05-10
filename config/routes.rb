Rails.application.routes.draw do
  
  resources :polls do
    resources :questions
    resources :replies, only: [ :new, :create ]
  end

  resources :coaches
  
  resources :pupils

  resources :workouts

  resources :muscle_groups

  devise_for :users

  root 'pages#index'
  
end

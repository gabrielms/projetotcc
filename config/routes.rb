Rails.application.routes.draw do
  
  get 'inference_results' => 'inference_results#index'
  get 'inference_results/:pupil_id' => 'inference_results#show'

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

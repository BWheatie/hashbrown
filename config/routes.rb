Rails.application.routes.draw do
  use_doorkeeper
  resources :users
  resources :messages

  root 'users#index'

  match "/404" => "errors#not_found", via: :all
  match "/500" => "errors#exception", via: :all
end

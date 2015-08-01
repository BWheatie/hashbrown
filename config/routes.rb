Rails.application.routes.draw do
  use_doorkeeper
  devise_for :users
  resources :users do
    get :messages
    put :follow
    put :unfollow
  end

  resources :messages

  root 'users#index'

  match "/404" => "errors#not_found", via: :all
  match "/500" => "errors#exception", via: :all
end

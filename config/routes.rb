Rails.application.routes.draw do
  use_doorkeeper

  resources :users, except: [:new, :edit] do
    resources :messages, only: [:index]
    put :follow
    put :unfollow
  end

  resources :messages, except: [:new, :edit]

  root 'pages#home'

  match "/404" => "errors#not_found", via: :all
  match "/500" => "errors#exception", via: :all
end

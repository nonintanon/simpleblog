require 'sidekiq/web'
Simpleblog::Application.routes.draw do
  devise_for :users

  resources :posts do 
    resources :comments, except: [:show]
    resources :subscriptions, only: [:create, :destroy]
  end

  resources :photos do 
    resources :comments, except: [:show]
    resources :subscriptions, only: [:create, :destroy]
  end


  mount Sidekiq::Web => '/sidekiq'
  match '/:id' => 'high_voltage/pages#show', :as => :static, :via => :get
  root :to => 'high_voltage/pages#show', :id => 'home'
end

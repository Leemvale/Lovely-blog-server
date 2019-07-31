Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  get 'welcome/index'

  resources :articles do
    resources :comments
  end

  resources :users, :only => [:index, :show] do
    resources :articles
  end

  resource :friendships, :only => [:create]

  root 'welcome#index'
end
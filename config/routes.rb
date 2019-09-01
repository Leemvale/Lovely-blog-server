Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: "users/registrations" }
  get 'welcome/index'

  resources :articles do
    resources :comments
  end

  resources :profiles, :only => [:index, :show] do
    resources :articles
    resources :comments
  end

  resource :friendships, :only => [:create, :destroy]

  root 'welcome#index'
end
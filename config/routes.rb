Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  get 'welcome/index'

  resources :articles do
    resources :comments
  end
 
  root 'welcome#index'
end
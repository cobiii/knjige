Rails.application.routes.draw do
  get 'home/index'

	root to: 'home#index'
  devise_for :users

  resources :books
  resources :chapters
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

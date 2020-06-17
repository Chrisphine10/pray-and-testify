Rails.application.routes.draw do
  resources :devotions
  root 'home#index'
  devise_for :users
  resources :posts do 
	resources :testimonies
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

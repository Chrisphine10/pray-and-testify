Rails.application.routes.draw do
  get 'blogs/index'
  get 'blogs/new'
  get 'blogs/show'
  get 'blogs/edit'
  resources :devotions
  root 'home#index'
  devise_for :users
  resources :posts do 
	resources :testimonies
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

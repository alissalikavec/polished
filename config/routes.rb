Rails.application.routes.draw do
  devise_for :users
  get 'users/:id' => 'users#show', as: :user
  
  resources :polishes do
  	resources :reviews, except: [:index], controller: 'polishes/reviews'
  	resources :favorites, only: [:create, :destroy]
  	resources :wants, only: [:create, :destroy]
  	resources :owns, only: [:create, :destroy]
  end
  get 'about' => 'welcome#about'
  root 'welcome#index'
end

Rails.application.routes.draw do
  devise_for :users
  
  resources :polishes do
  	resources :reviews, except: [:index], controller: 'polishes/reviews'
  end
  get 'about' => 'welcome#about'
  root 'welcome#index'
end

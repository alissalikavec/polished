Rails.application.routes.draw do
  devise_for :users
  resources :polishes
  get 'about' => 'welcome#about'
  root 'welcome#index'
end

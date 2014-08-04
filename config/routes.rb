Rails.application.routes.draw do
  resources :polishes
  get 'about' => 'welcome#about'
  root 'welcome#index'
end

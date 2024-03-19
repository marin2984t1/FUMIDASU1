Rails.application.routes.draw do
  
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'sports/new' => 'sports#new' 
  post 'sports/new' => 'sports#new' 

  patch 'sports/:id' => 'sports#update'
  post 'sports/:id/edit' => 'sports#edit', as:'edit_sport'
  
  get 'sports/top' => 'sports#top'
  resources :sports
  resources :blogs
  
  root 'sports#top'

end

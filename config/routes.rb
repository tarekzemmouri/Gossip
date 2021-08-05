Rails.application.routes.draw do
  resources :gossips
 
  post 'gossips/new', to: 'gossips#create'
  post 'gossips/:id/edit', to: 'gossips#update'
  get 'team', to: 'gossips#team'
  get 'contact', to: 'gossips#contact'
  
  root to: 'sessions#view'
  resources :sessions, only:[:new,:create,:destroy]
  
end

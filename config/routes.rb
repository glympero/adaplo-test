Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'
  get 'pages/home', to: 'pages#home'
  post 'pages/add_user', to: 'pages#add_user'
  post 'pages/remove_user', to: 'pages#remove_user'
end

Rails.application.routes.draw do
  root 'home_pages#home'
  get '/about', to: 'home_pages#about'
end

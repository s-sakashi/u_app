Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'
  get 'sessions/new'
  get 'users/new'
  get 'hotsprings/new'
  root 'home_pages#home'
  get '/about', to: 'home_pages#about'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users
  resources :hotsprings do
    collection do
      get ':hotspring_id/reviews', to: 'hotsprings#reviews'
    end
  end
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :reviews, only: [:create, :edit, :update, :destroy]
end

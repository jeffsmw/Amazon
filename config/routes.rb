Rails.application.routes.draw do
  # get '/' => 'home#index', as: :home
  root 'home#index'
  get '/about' => 'home#about'
  get '/contact' => 'home#contact'
  post '/submission' => 'home#submission'
  get '/faq' => 'home#faq'

  resources :products do
    resources :reviews, only: [:create, :destroy]
  end
  resources :users, only: [:create, :new]
  resources :sessions, only: [:create, :new, :destroy] do
    delete :destroy, on: :collection
  end

  namespace :admin do
     resources :questions, :comments
  end
end

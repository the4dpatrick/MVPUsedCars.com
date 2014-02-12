Mvp::Application.routes.draw do
  root 'pages#index'

  post 'contact', to: 'contact#create', as: 'contact_create'

  controller :pages do
    get 'faq', to: 'pages#faq'
    get 'location', to: 'pages#location'
    get 'contact-us', to: 'pages#contact', as: 'contact'
    get 'contact-us/:subject', to: 'pages#contact'
    get 'about-us', to: 'pages#about', as: 'about'
  end

  resources :cars
  get '/inventory', to: 'cars#inventory'

  resources :uploads

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  match '/signin', to: 'sessions#new', via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'
end

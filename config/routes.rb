Mvp::Application.routes.draw do
  root 'pages#index'

  post 'contact', to: 'contact#create', as: 'contact_create'

  controller :pages do
    get 'faq', to: 'pages#faq'
    get 'location', to: 'pages#location'
    get 'contact-us', to: 'pages#contact', as: 'contact'
    get 'about-us', to: 'pages#about', as: 'about'
  end

  get '/inventory', to: 'cars#inventory'
  resources :cars

  resources :uploads

  match '/dashboard', to: 'users#dashboard', via: 'get'
  resources :users

  match '/signin', to: 'sessions#new', via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'
  resources :sessions, only: [:new, :create, :destroy]

  resources :reviews
end

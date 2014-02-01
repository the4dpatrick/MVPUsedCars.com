Mvp::Application.routes.draw do
  root 'pages#index'

  post 'contact', to: 'contact#create', as: 'contact_create'

  controller :pages do
    get 'faq', to: 'pages#faq'
    get 'location', to: 'pages#location'
    get 'contact-us', to: 'pages#contact', as: 'contact'
    get 'about-us', to: 'pages#about', as: 'about'
  end

  controller :cars do
    # Inventory shows multiple cars
    # car_show shows a single car
    get 'inventory', to: 'cars#index', as: 'inventory'
    # get 'inventory/show', to: 'cars#show', as: 'car_show'
    # match 'inventory/new', to: 'cars#new'
    # match 'inventory/edit', to: 'cars#edit'
  end
  resources :cars
end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #
  resources :books, only: :index do
    get :search, on: :collection
  end

  resources :carts, only: :index

  resources :users, only: %i[index show]
end

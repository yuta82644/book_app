Rails.application.routes.draw do
  devise_for :users
  root 'books#search'
  get 'search', to: 'books#search'
  post 'add_to_bookshelf', to: 'books#add_to_bookshelf'
  resources :bookshelf do
    member do
      post 'add_review'
    end
  end
end

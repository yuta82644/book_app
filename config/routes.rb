Rails.application.routes.draw do
  root 'books#search'
  get 'search', to: 'books#search'
  post 'add_to_bookshelf', to: 'books#add_to_bookshelf'
  resources :bookshelf do

  end
end

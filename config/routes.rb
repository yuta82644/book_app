Rails.application.routes.draw do
  root 'books#search'
  get 'search', to: 'books#search'
end

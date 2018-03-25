Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/book_list", to: "book_list#show"
  get "/book_shelf", to: "book_shelf#show"
  #get "/books/new", to: "books#new"
  resources :books
end

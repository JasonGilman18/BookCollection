Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #defines which action handles the route page
  root "books#index"

  #creates actions index, create, new, edit, show, update
  resources :books

  #add route so i can render a view before delete method call
  get '/books/:id/remove', to: 'books#remove', as: 'remove_book'

end

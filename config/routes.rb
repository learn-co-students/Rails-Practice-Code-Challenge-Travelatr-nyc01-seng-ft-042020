Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :bloggers, only: [:new, :create, :show, :index]
  resources :destinations, only: [:show, :index]
  resources :posts, except: [:delete]

  post 'posts/:id', to: "posts#addlike"
end

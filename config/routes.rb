Rails.application.routes.draw do
  resources :posts, except: [:index, :destroy]

  resources :destinations, only: [:show]

  get '/bloggers/new', to: 'bloggers#new', as:'new_blogger'
  
  get '/bloggers/:id', to: 'bloggers#show', as: 'blogger'

  post '/bloggers', to: 'bloggers#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

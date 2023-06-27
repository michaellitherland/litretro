Rails.application.routes.draw do
  # get 'home/index'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :retros do
    resources :columns do
      resources :cards
    end
    resources :icebreakers
    resources :participants
  end

  get '/active', to: 'active#index'
  get '/welcome/:id', to: 'welcome#index'
  get '/started/:id', to: 'started#index'
  post '/started/:id', to: 'started#create'
  get '/pointing/:id', to: 'pointing#index'
  get '/discussion/:id', to: 'discussion#index'
  get '/complete/:id', to: 'complete#index'
  post '/cards', to: 'cards#create'

  # Defines the root path route ("/")
  # root "articles#index"
  root 'home#index'
end

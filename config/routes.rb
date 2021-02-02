Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope '/api' do
    get '/subscriptions', to: 'subscriptions#index'
    post '/subscriptions', to: 'subscriptions#create'
    get '/subscriptions/:id', to: 'subscriptions#show'
    put '/subscriptions/:id', to: 'subscriptions#update'
    delete '/subscriptions/:id', to: 'subscriptions#destroy'

    # scope '/auth' do
    #   post '/sign_up', to: 'users#create'
    #   post '/sign_in', to: 'users#sign_in'
    # end
  end

  post '/login',    to: 'sessions#create'
  post '/logout',   to: 'sessions#destroy'
  get '/logged_in', to: 'sessions#is_logged_in?'

  resources :users, only: [:create, :show, :index] do 
      resources :items, only: [:create, :show, :index, :destroy]
   end

end

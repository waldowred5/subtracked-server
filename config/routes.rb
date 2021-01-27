Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope '/api' do
    get '/subscriptions', to: 'subscriptions#index'
    post '/subscriptions', to: 'subscriptions#create'
    get '/subscriptions', to: 'subscriptions#show'
    put '/subscriptions/:id', to: 'subscriptions#update'
    delete '/subscriptions/:id', to: 'subscriptions#destroy'
  end
end

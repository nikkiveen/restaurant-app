Rails.application.routes.draw do
  devise_for :restaurant_admins
  devise_for :diners
  get '/' => 'landing_pages#landing'
  ###################################################
  get '/logins' => 'log_ins#index'
  ###################################################
  get '/theme' => 'theme#index'
  ###################################################
  get '/restaurants' => 'restaurants#index'
  get '/restaurants/available' => 'restaurants#available'
  get '/restaurants/new' => 'restaurants#new'
  post '/restaurants' => 'restaurants#create'
  get '/restaurants/:id' => 'restaurants#show'
  get '/restaurants/:id/edit' => 'restaurants#edit'
  patch '/restaurants/:id' => 'restaurants#update'
  delete '/restaurants/:id' => 'restaurants#destroy'
  post '/search' => 'restaurants#run_search'
  ###################################################
  get '/reservations' => 'reservations#index'
  get '/reservations/new' => 'reservations#new'
  post '/reservations' => 'reservations#create'
  get '/reservations/:id' => 'reservations#show'
  delete '/reservations/:id' => 'reservations#destroy'
  ###################################################

  namespace :api do
    namespace :v1 do
      get '/restaurants' => 'restaurants#index'
      get '/restaurants/:id' => 'restaurants#show'
    end
  end
end

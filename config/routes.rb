Rails.application.routes.draw do
  devise_for :restaurant_admins
  devise_for :diners
  ###################################################
  get '/' => 'restaurants#index'
  get '/restaurants' => 'restaurants#index'
  get '/restaurants/new' => 'restaurants#new'
  post '/restaurants' => 'restaurants#create'
  get '/restaurants/:id' => 'restaurants#show'
  get '/restaurants/:id/edit' => 'restaurants#edit'
  patch '/restaurants/:id' => 'restaurants#update'
  ###################################################
  post '/reservations' => 'reservations#create'
end

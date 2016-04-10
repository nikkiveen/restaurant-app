Rails.application.routes.draw do
  devise_for :restaurant_admins
  devise_for :diners
  get '/' => 'restaurants#index'
  get '/restaurants' => 'restaurants#index'
  get '/restaurants/:id' => 'restaurants#show'
  ###################################################
  post '/reservations' => 'reservations#create'
end

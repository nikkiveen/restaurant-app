Rails.application.routes.draw do
  devise_for :restaurant_admins
  devise_for :diners
  get '/' => 'restaurants#index'
  get '/restaurants' => 'restaurants#index'
  get '/restaurnts/:id' => 'restaurants#show'
end

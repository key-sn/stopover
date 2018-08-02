Rails.application.routes.draw do

  # namespace :api, default: {format: :json} do
  #   resources :stops, only: :create
  # end
  # post  '/api/stops' =>  'api/stops#create'
  namespace :api do
    resources :stops, only: :create
  end
  namespace :api, default: {format: :json} do
    get 'stops' =>  'stops#search'
  end

end

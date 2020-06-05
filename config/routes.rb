Rails.application.routes.draw do

  namespace :api, defaults: {format: :json} do 
    resources :sessions, only: [:create]
    resources :registrations, only: [:create]
    resources :users, only: [:index]
    resources :relationships, only: [:create, :destroy]
    get :logged_in, to: "sessions#logged_in"
    delete :logout, to: "sessions#logout"
  end
  root to: "static#home"
end

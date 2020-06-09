Rails.application.routes.draw do

  root "static_pages#root"

  namespace :api, defaults: {format: :json} do 
    resources :sessions, only: [:create]
    resources :registrations, only: [:create]
    resources :users, only: [:index, :show]
    resources :relationships, only: [:create, :destroy, :show]
    resources :tweets, only: [:create, :index, :destroy]
    resources :tags, only: [:index, :show]
    get :logged_in, to: "sessions#logged_in"
    delete :logout, to: "sessions#logout"
  end
  root to: "static#home"
end

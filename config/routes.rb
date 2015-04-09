Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "users/registrations" }
  root 'home#index'
  get '/home/search_movie', to: 'home#search_movie', as: :search_movie

end
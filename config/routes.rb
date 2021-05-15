# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :accounts

  # TODO: Add root route as needed/necessary
  # unauthenticated :user do
  #   root to: 'static_pages#landing'
  # end
  
  get 'uploads', to: 'uploads#index'
  post 'upload', to: 'uploads#upload'
  resources :properties
  root to: 'properties#index'
end

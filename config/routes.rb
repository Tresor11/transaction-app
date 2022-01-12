# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users , :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout' , :sign_up => 'register'}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :groups
  resources :transactions

  get '/external',   to: 'transactions#external'
  root to: 'users#welcome'
end

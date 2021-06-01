# frozen_string_literal: true

Rails.application.routes.draw do
  root 'halls#index'
  resources :halls
  resources :movies
end

# frozen_string_literal: true

Rails.application.routes.draw do
  root 'halls#index'
  resources :halls
  resources :movies
  resources :seances
  resources :tickets
  resources :ticket_desks
end

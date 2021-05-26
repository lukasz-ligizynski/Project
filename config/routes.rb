Rails.application.routes.draw do
  root "halls#index"
  resources :halls
end

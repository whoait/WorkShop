# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => '/admins', as: 'rails_admin'
  resources :developers
  root to: 'developers#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :developers, only: %i[show]
    end
  end
end

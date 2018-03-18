# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    get 'loans/revenue'
  end

  root to: 'welcome#index'

  resources :clients, only: %i[new create]
end

# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users, only: :create
  resources :todos, only: %i[index create update destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

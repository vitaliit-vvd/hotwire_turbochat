# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  root 'rooms#index'
  resources :rooms, only: %i[show create], param: :title
  resources :messages, only: :create
end

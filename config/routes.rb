# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }

  root 'rooms#index'

  resources :users, only: :show, as: :account
  resources :rooms, only: %i[show create], param: :title do
    get :favorites, on: :collection
    resource :favorites, only: %i[create destroy]
  end
  resources :messages, only: :create do
    member { post :like }
  end
end

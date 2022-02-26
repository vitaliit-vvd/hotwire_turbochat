# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' } # sessions: "sessions",

  root 'rooms#index'

  resources :rooms, only: %i[show create], param: :title do
    resource :favorites, only: %i[create destroy]
  end
  resources :messages, only: :create do
    member { post :like }
  end
  resources :users, only: :show, as: :account
end

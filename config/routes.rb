# frozen_string_literal: true

Rails.application.routes.draw do
  resources :authors, only: %i[index show create update destroy]

  resources :courses, only: %i[index show create update destroy]

  resources :talents, only: %i[index show create update destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

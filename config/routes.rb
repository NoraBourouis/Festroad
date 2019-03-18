Rails.application.routes.draw do
  get 'fest_submissions/create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :wish_lists, only: [:index, :destroy]
  resources :home, only: [:index]
  resources :kitui, only: [:index]
  resources :contact, only: [:new, :create]
  resources :fest_submissions, only: [:new, :create]
  resources :festivals, only: [:index, :show]
  root 'home#index'
  resources :fests, only: [:index]

  devise_for :users, :controllers => { registrations: 'registrations' }
  
  resources :profiles, only: [:show] do
    resources :avatars, only: [:create]
  end

  namespace :admin do
    resources :fests
    resources :users, only: [:index, :edit, :update, :destroy]
  end

end

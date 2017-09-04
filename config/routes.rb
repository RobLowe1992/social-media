Rails.application.routes.draw do

  # get 'friendships/:create'
  # get 'friendships/:destroy'

  root 'homes#index'
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  devise_scope :user do
    get 'users/:id' => 'users/registrations#show', as: 'users'
  end
  resources :homes, only: :index
  resources :posts, except: :show
  resources :friendships, only: [:create, :destroy, :index]
  resources :users do
    member do
      get :following, :followers
    end
  end


end

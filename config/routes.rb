Rails.application.routes.draw do


  resources :posts, except: :show
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  devise_scope :user do
    get 'users/:id' => 'users/registrations#show'
  end

  root 'homes#index'
  resources :homes, only: :index


end

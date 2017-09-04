Rails.application.routes.draw do

  # get 'friendships/:create'
  # get 'friendships/:destroy'

  root 'homes#index'
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  devise_scope :user do
    get 'users/:id' => 'users/registrations#show', as: 'users'
    get '/following' => 'users/registrations#following'
    get '/followers' => 'users/registrations#followers'
    get '/:first_name-:last_name' => 'users/registrations#custom', as: 'custom'
  end
  resources :homes, only: :index
  resources :posts, except: :show do
    post '/comments' => 'application#create'
  end
  resources :friendships, only: [:create, :destroy]
  resources :users do
    member do
      get :following, :followers
    end
  end

end

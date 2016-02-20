Rails.application.routes.draw do
  devise_for :users, skip: [:registrations],  controllers: {registrations: 'users/registrations'}
  as :user do

    get   '/signup' => 'users/registrations#new',    as: 'new_user_registration'
    post  '/signup' => 'users/registrations#create', as: 'user_registration'

  end

  root to: 'pages#home'
  get '/editor', to: 'pages#editor', as: :editor
  scope '/graphql' do
    post "/", to: "graphql#create"
  end

  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end

Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :auth do
      post 'register', to: 'auth#register'
      post 'login', to: 'auth#login'
    end

    resources :posts do
      resources :comments, only: [:index, :create]
    end
  end

  # healthcheck
  get '/health', to: proc { [200, {}, ['OK']] }
end
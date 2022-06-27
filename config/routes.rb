Rails.application.routes.draw do
  namespace :admin do
      resources :authentications
      resources :results
      resources :dragons
      resources :users

      root to: "authentications#index"
    end
  root to: 'home#index'

  namespace :api, format: 'json' do
    namespace :v1 do
      post 'oauth/callback', to: 'oauths#callback'
      get 'oauth/callback', to: 'oauths#callback'
      get 'oauth/:provider', to: 'oauths#oauth', as: :auth_at_provider
      delete 'logout', to: 'user_sessions#destroy'
      resources :accounts, only: %i[index create show]
      resources :results, only: %i[index create show] do
        member do
          get 'previous_results'
        end
      end
      resources :dragons, only: %i[show index]
      resources :users, only: %i[index edit update show destroy] do
        collection do
          get 'me'
        end
      end
      resource :user_settings, only: %i[update destroy]
    end
  end

  get '/dragons/:id', to: 'dragon_shares#show', constraints: { user_agent: /Twitterbot/ }
  get '/login_as/:user_id', to: 'test_sessions#login_as' unless Rails.env.production?
  get '*path', to: 'home#index'
end

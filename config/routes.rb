Rails.application.routes.draw do
  namespace :admin do
    resources :authentications
    resources :results
    resources :dragons
    resources :users
    resources :levels

    root to: 'authentications#index'
  end
  root to: 'home#index'

  namespace :api, format: 'json' do
    namespace :v1 do
      post 'oauth/callback', to: 'oauths#callback'
      get 'oauth/callback', to: 'oauths#callback'
      get 'oauth/:provider', to: 'oauths#oauth', as: :auth_at_provider
      delete 'logout', to: 'user_sessions#destroy'
      resources :results, only: %i[create show] do
        member do
          get 'last_result'
          get 'previous_results'
        end
      end
      resources :dragons, only: %i[show]
      resources :users, only: %i[show] do
        collection do
          get 'me'
        end
      end
      resource :user_settings, only: %i[update destroy]
      resources :levels, only: %i[create show update]
    end
  end

  get '/dragons/:id', to: 'dragon_shares#show', constraints: { user_agent: /Twitterbot/ }
  get '/login_as/:user_id', to: 'test_sessions#login_as' unless Rails.env.production?
  get '*path', to: 'home#index'
end

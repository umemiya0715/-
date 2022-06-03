Rails.application.routes.draw do
  root to: 'home#index'

  namespace :api, format: 'json' do
    namespace :v1 do
      post 'oauth/callback', to: 'oauths#callback'
      get 'oauth/callback', to: 'oauths#callback'
      get 'oauth/:provider', to: 'oauths#oauth', as: :auth_at_provider
      delete 'logout', to: 'user_sessions#destroy'
      resources :accounts, only: %i[index create show]
      resources :results, only: %i[index create show]
      resources :dragons, only: %i[show]
      resources :users, only: %i[:index, :edit, :update, :show, :destory] do
        collection do
          get 'me'
        end
      end
    end
  end

  get '/dragons/:id', to: 'dragon_shares#show', constraints: { user_agent: /Twitterbot/ }
  get '*path', to: 'home#index'
end

Rails.application.routes.draw do
  root to: 'home#index'

  namespace :api, format: 'json' do
    namespace :v1 do
      resources :accounts, only: %i[index create show]
      resources :analyzeddata, only: %i[index create show]
      resources :dragons, only: %i[show]
    end
  end

  get '/dragons/:id', to: 'dragon_shares#show', constraints: { user_agent: /Twitterbot/ }
  get '*path', to: 'home#index'
end

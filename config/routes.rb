Rails.application.routes.draw do
  root to: 'home#index'

  namespace :api, format: 'json' do
    namespace :v1 do
      resources :accountdata, only: %i[index create show]
      resources :analyzeddata, only: %i[index create show]
      resources :dragons, only: %i[index show]
    end
  end

  get '*path', to: 'home#index'
end

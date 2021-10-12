Rails.application.routes.draw do
  root to: 'home#index'

  namespace :api, format: 'json' do
    namespace :v1 do
      resources :accounts, only: %i[index create show]
      resources :analyzeddata, only: %i[index create show]
      resources :dragons, only: %i[show]
    end
  end

end

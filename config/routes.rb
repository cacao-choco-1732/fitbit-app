Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :oauth, only: %i(index)
  resources :accounts, only: %i(index new create destroy) do
    member do
      post :activate
    end
  end
  namespace :reports do
    resources :activity_steps, only: %i(index)
  end
end

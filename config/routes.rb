Rails.application.routes.draw do
  devise_for :users
  resources :portfolios, except: [:show]

  get 'javascript-items', to: 'portfolios#javascript'

  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'

  get 'about-us', to: 'pages#about'

  get 'contact', to: 'pages#contact'

  resources :blogs do
    member do
      get :toggle_status
    end
  end

  root to: 'pages#home'
end

Rails.application.routes.draw do

  # get 'cotisations/show'
  # get 'cotisations/new'
  # get 'cotisations/create'
  # get 'cotisations/destroy'
  devise_for :users
  root to: 'pages#home'

  delete '/cotisation/:id/owners', to: 'cotisations#suppression', as: 'cotisation_delete_by_owners'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/dashboard', to: 'profiles#dashboard'

  resources :services, only:[:index, :show] do
    resources :subscriptions, only:[:index, :new, :create, :show]
  end

  resources :subscriptions, except:[:new, :create] do
    resources :cotisations, only:[:index, :new, :create]
  end

  resources :cotisations, only:[:destroy, :show] do
    # resources :orders, only: [:show, :create]
    resources :reviews, only:[:new, :create]
    resources :payments, only: :new
  end

  resources :orders, only: [:show, :create] do
  end

  resources :reviews, only: :destroy


  # decommenter ci dessous pour activer la route pour le webhook
  # mount StripeEvent::Engine, at: '/stripe-webhooks'
  # le reste a modifier est dans le fichier
  # config/initializer/stripe.rb

end

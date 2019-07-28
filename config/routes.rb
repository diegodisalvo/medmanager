Rails.application.routes.draw do
  devise_for :users

  root "patients#home"

  resources :patients do
    collection do
      get :home
      get :start
      get :search
    end
    member do
      get :delete
      post :destory
    end
  end

  get 'inizio', to: 'patients#start', as: 'inizio'
  get 'home', to: 'patients#home', as: 'home'

  resources :examinations do
    member do
      get :delete
      post :destroy
    end
  end

  resources :locations do
    member do
      get :delete
      post :destroy
    end
  end

  resources :users do
    member do
      get :delete
      post :destroy
      post :change_location
    end
  end
end

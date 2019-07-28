Rails.application.routes.draw do
  devise_for :users

  root "patients#home"

  resources :patients do
    collection do
      get :home
      get :search
    end
    member do
      get :delete
      post :destory
    end
  end

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

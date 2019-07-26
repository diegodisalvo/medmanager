Rails.application.routes.draw do
  devise_for :users

  root "patients#index"

  resources :patients do
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
end

Rails.application.routes.draw do
  get '/', to: "homes#index"
  devise_for :users

  resources :users do
    resources :walks
  end
  resources :sites
  resources :reviews
  resources :users, only: [:index, :destroy]
  resources :walks do
    resources :sites
    resource :reviews
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

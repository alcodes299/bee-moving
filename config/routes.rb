Rails.application.routes.draw do
  get '/', to: "homes#index"
  devise_for :users

  resource :users do
    resources :walks
  end
  resources :sites
  resources :walks do
    resources :sites
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

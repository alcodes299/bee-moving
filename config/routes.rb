Rails.application.routes.draw do
  get '/', to: "homes#index"
  devise_for :users

  resources :sites
  resources :walks
  resource :users
  get '*path', to: "homes#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  devise_for :users

  resources :customers do
    get 'find_by_cep', on: :member
  end

  root to: "customers#index"

end

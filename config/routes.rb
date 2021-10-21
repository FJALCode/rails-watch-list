Rails.application.routes.draw do
  root to: 'lists#index'
  resources :lists, only: [:new, :create, :show, :index] do
    resources :bookmarks, only: [:new, :create]
  end
  resources :bookmarks, only: [:destroy]
end

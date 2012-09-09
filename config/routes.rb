Recipieces::Application.routes.draw do
  devise_for :users

  resources :users, :categories, :recipes

  resources :pictures do
    member do
      get 'thumbnail'
    end
  end

  root :to=> 'home#index'
end

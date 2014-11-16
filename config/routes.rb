Recipieces::Application.routes.draw do
  devise_for :users

  resources :users, :categories, :recipes, :albums

  resources :pictures do
    member do
      get 'thumbnail'
    end
  end

  resources :videos do
    member do
      get 'thumbnail'
    end
  end

  root :to=> 'home#index'
end

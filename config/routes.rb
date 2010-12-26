Recipieces::Application.routes.draw do |map|
  resources :ingredients

  resources :categories

  resources :recipes

  resources :pictures do
    member do
      get 'thumbnail'
    end
  end
  
  root :to=> 'home#index'

end

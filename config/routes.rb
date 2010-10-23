Recipieces::Application.routes.draw do |map|
  resources :ingredients

  resources :categories

  resources :recipes

  resources :pictures
  
  root :to=> 'home#index'

end

Rails.application.routes.draw do
  resources :product_variants
  resources :products
  resources :sizes
  resources :colors
  resources :types
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

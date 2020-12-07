Rails.application.routes.draw do
  resources :products do 
    collection do
      get 'get_colors', to: "products#get_colors"
      get 'get_sizes', to: "products#get_sizes"
    end
  end    

  root to: 'products#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

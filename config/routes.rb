Rails.application.routes.draw do
  # get "/produtos" => "produtos#index"
  # get "/produtos/new" => "produtos#new"
  # post "/produtos" => "produtos#create"
  # delete "/produtos/:id" => "produtos#destroy", as: :produto
 
  root "produtos#index"
  
  resources :produtos, only: [:new, :create, :destroy, :edit, :update]
  get "/produtos/busca" => "produtos#busca", as: :busca_produto

  resources :departamentos
end

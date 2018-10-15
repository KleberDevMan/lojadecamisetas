Rails.application.routes.draw do
  # get "/produtos" => "produtos#index"
  # get "/produtos/new" => "produtos#new"
  # post "/produtos" => "produtos#create"
  # delete "/produtos/:id" => "produtos#destroy", as: :produto
  






  root "produtos#index"
  
  resources :produtos, only: [:new, :create, :destroy, :edit]
  get "/produtos/busca" => "produtos#busca", as: :busca_produto
  #get "/produtos/:id" => "produtos#edit", as: :editar_produto
  
  resources :departamentos
end

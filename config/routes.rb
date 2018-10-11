Rails.application.routes.draw do
  root "produtos#index"
  # get "/produtos" => "produtos#index"

  # get "/produtos/new" => "produtos#new"
  # post "/produtos" => "produtos#create"
  # delete "/produtos/:id" => "produtos#destroy", as: :produto
  
  resources :produtos, only: [:new, :create, :destroy]
  get "/produtos/busca" => "produtos#busca", as: :busca_produto

end

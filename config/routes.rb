Rails.application.routes.draw do
  get "produtos" => "produtos#index"
  get "produtos/new" => "produtos#new"

  root "produtos#index"
end

class ProdutosController < ApplicationController

    def index
        @produtos = Produto.order(:nome).limit 2
    end

end

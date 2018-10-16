class ProdutosController < ApplicationController

    before_action :set_produto, only: [:edit, :update, :destroy]

    # carrega index
    def index
        @produtos_por_nome = Produto.order(:nome).limit 5
        @produtos_por_preco = Produto.order(:preco).limit 2
    end

    # carrega para cadastro
    def new 
        @produto = Produto.new
        renderiza :new
    end

    # salva
    def create
        @produto = Produto.new produto_params
        if @produto.save
            flash[:notice] = "Produto salvo com sucesso"
            redirect_to root_url    
        else
            renderiza :new
        end
    end

    # carrega para edicao
    def edit
        renderiza :edit
    end

    # atualiza
    def update
        if @produto.update produto_params
            flash[:notice] = "Produto atualizado com sucesso"
            redirect_to root_url
        else
            renderiza :edit
        end
    end

    # delete
    def destroy
        @produto.destroy
        redirect_to root_url
    end

    # carrega index com filtro
    def busca
        @nome_a_buscar = params[:nome]
        @produtos = Produto.where "nome like ?", "%#{@nome_a_buscar}%"
    end

    private

    def renderiza(view)
        @departamentos = Departamento.all
        render view
    end
    # pega o produto passado na URI
    def set_produto
        id = params[:id]
        @produto = Produto.find(id)
    end
    def produto_params
        params.require(:produto).permit :nome, :preco, :descricao, :quantidade, :departamento_id
    end

end

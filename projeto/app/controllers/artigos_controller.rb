class ArtigosController < ApplicationController
  before_action :set_artigo, only: [:show, :edit, :update, :destroy]
  before_action :authorize
  # GET /artigos
  # GET /artigos.json
  def index

    @artigos = Artigo.search(params).paginate(:page => params[:page]).order('created_at DESC')
      
  end

  # GET /artigos/1
  # GET /artigos/1.json
  def show
    
  end

  # GET /artigos/new
  def new
    @artigo = Artigo.new
  end

  # GET /artigos/1/edit
  def edit
  end

  # POST /artigos
  # POST /artigos.json
  def create
    @artigo = Artigo.new(artigo_params)
    @artigo.user_id = current_user.id
    @artigo.data = Time.now.utc
    respond_to do |format|
      if @artigo.save
        format.html { redirect_to @artigo, notice: 'Artigo was successfully created.' }
        format.json { render :show, status: :created, location: @artigo }
      else
        format.html { render :new }
        format.json { render json: @artigo.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # PATCH/PUT /artigos/1
  # PATCH/PUT /artigos/1.json
  def update
    respond_to do |format|
      if @artigo.update(artigo_params)
        format.html { redirect_to @artigo, notice: 'Artigo was successfully updated.' }
        format.json { render :show, status: :ok, location: @artigo }
        if @current_user.id != @artigo.user_id #Verificando q se o criador do artigo for igual ao que está colaborando 
          colaborador = UserArtigo.create(:user_id => @current_user.id, :artigo_id => @artigo.id) #criar um novo colaborador
          @ultimcolab = colaborador
        end
      else
        format.html { render :edit }
        format.json { render json: @artigo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /artigos/1
  # DELETE /artigos/1.json
  def destroy
    @artigo.destroy
    respond_to do |format|
      format.html { redirect_to artigos_url, notice: 'Artigo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artigo
      @artigo = Artigo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def artigo_params
      params.require(:artigo).permit(:titulo, :data, :conteudo, :user_id,:subtitulo)
    end
end

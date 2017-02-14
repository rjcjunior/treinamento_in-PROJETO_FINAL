class VotosArtigosController < ApplicationController
  before_action :set_votos_artigo, only: [:show, :edit, :update, :destroy]

  # GET /votos_artigos
  # GET /votos_artigos.json
  def index
    @votos_artigos = VotosArtigo.all
  end

  # GET /votos_artigos/1
  # GET /votos_artigos/1.json
  def show
  end

  # GET /votos_artigos/new
  def new
    @votos_artigo = VotosArtigo.new
  end

  # GET /votos_artigos/1/edit
  def edit
  end

  # POST /votos_artigos
  # POST /votos_artigos.json
  def create
      
      @votos_artigo = VotosArtigo.new(votos_artigo_params)
      @votos_artigo.save
     
  end

  # PATCH/PUT /votos_artigos/1
  # PATCH/PUT /votos_artigos/1.json
  def update
    
   @votos_artigo.update(votos_artigo_params)
  end

  # DELETE /votos_artigos/1
  # DELETE /votos_artigos/1.json
  def destroy
    @votos_artigo.destroy
    respond_to do |format|
      format.html { redirect_to votos_artigos_url, notice: 'Votos artigo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
    
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_votos_artigo
      @votos_artigo = VotosArtigo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def votos_artigo_params
        params.require(:votos_artigo).permit(:user_id, :artigo_id, :votoArtigo)
    end
    
end

class PerguntaController < ApplicationController
  before_action :set_perguntum, only: [:show, :edit, :update, :destroy]
  before_action :authorize
  # GET /pergunta
  # GET /pergunta.json
  def index
    @pergunta = Perguntum.all
  end

  # GET /pergunta/1
  # GET /pergunta/1.json
  def show
  end

  # GET /pergunta/new
  def new
    @perguntum = Perguntum.new
  end

  # GET /pergunta/1/edit
  def edit
  end

  # POST /pergunta
  # POST /pergunta.json
  def create
    @perguntum = Perguntum.new(perguntum_params)
    @perguntum.user_id = current_user.id
    @perguntum.data = Time.now.utc
    respond_to do |format|
      if @perguntum.save
        format.html { redirect_to @perguntum, notice: 'Perguntum was successfully created.' }
        format.json { render :show, status: :created, location: @perguntum }
      else
        format.html { render :new }
        format.json { render json: @perguntum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pergunta/1
  # PATCH/PUT /pergunta/1.json
  def update
    respond_to do |format|
      if @perguntum.update(perguntum_params)
        format.html { redirect_to @perguntum, notice: 'Perguntum was successfully updated.' }
        format.json { render :show, status: :ok, location: @perguntum }
      else
        format.html { render :edit }
        format.json { render json: @perguntum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pergunta/1
  # DELETE /pergunta/1.json
  def destroy
    @perguntum.destroy
    respond_to do |format|
      format.html { redirect_to pergunta_url, notice: 'Perguntum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_perguntum
      @perguntum = Perguntum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def perguntum_params
      params.require(:perguntum).permit(:titulo, :data, :conteudo, :user_id)
    end
end

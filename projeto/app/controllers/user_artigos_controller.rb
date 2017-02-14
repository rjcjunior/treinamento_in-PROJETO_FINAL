class UserArtigosController < ApplicationController
  before_action :set_user_artigo, only: [:show, :edit, :update, :destroy]
  before_action :authorize
  before_filter :authorize_admin
  # GET /user_artigos
  # GET /user_artigos.json
  def index
    @user_artigos = UserArtigo.all
  end

  # GET /user_artigos/1
  # GET /user_artigos/1.json
  def show
  end

  # GET /user_artigos/new
  def new
    @user_artigo = UserArtigo.new
  end

  # GET /user_artigos/1/edit
  def edit
  end

  # POST /user_artigos
  # POST /user_artigos.json
  def create
    
    @user_artigo = UserArtigo.new(user_artigo_params)

    respond_to do |format|
      if @user_artigo.save
        format.html { redirect_to @user_artigo, notice: 'User artigo was successfully created.' }
        format.json { render :show, status: :created, location: @user_artigo }
      else
        format.html { render :new }
        format.json { render json: @user_artigo.errors, status: :unprocessable_entity }
      end
    end
  end
  
  
  # PATCH/PUT /user_artigos/1
  # PATCH/PUT /user_artigos/1.json
  def update
    respond_to do |format|
      if @user_artigo.update(user_artigo_params)
        format.html { redirect_to @user_artigo, notice: 'User artigo was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_artigo }
      else
        format.html { render :edit }
        format.json { render json: @user_artigo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_artigos/1
  # DELETE /user_artigos/1.json
  def destroy
    @user_artigo.destroy
    respond_to do |format|
      format.html { redirect_to user_artigos_url, notice: 'User artigo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_artigo
      @user_artigo = UserArtigo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_artigo_params
      params.require(:user_artigo).permit(:user_id, :artigo_id)
    end
end

class VotosPostsController < ApplicationController
  before_action :set_votos_post, only: [:show, :edit, :update, :destroy]

  # GET /votos_posts
  # GET /votos_posts.json
  def index
    @votos_posts = VotosPost.all
  end

  # GET /votos_posts/1
  # GET /votos_posts/1.json
  def show
  end

  # GET /votos_posts/new
  def new
    @votos_post = VotosPost.new
  end

  # GET /votos_posts/1/edit
  def edit
  end

  # POST /votos_posts
  # POST /votos_posts.json
  def create
    @votos_post = VotosPost.new(votos_post_params)

    respond_to do |format|
      if @votos_post.save
        format.html { redirect_to @votos_post, notice: 'Votos post was successfully created.' }
        format.json { render :show, status: :created, location: @votos_post }
      else
        format.html { render :new }
        format.json { render json: @votos_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /votos_posts/1
  # PATCH/PUT /votos_posts/1.json
  def update
    respond_to do |format|
      if @votos_post.update(votos_post_params)
        format.html { redirect_to @votos_post, notice: 'Votos post was successfully updated.' }
        format.json { render :show, status: :ok, location: @votos_post }
      else
        format.html { render :edit }
        format.json { render json: @votos_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /votos_posts/1
  # DELETE /votos_posts/1.json
  def destroy
    @votos_post.destroy
    respond_to do |format|
      format.html { redirect_to votos_posts_url, notice: 'Votos post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_votos_post
      @votos_post = VotosPost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def votos_post_params
      params.require(:votos_post).permit(:user_id, :post_id, :votoPost)
    end
end

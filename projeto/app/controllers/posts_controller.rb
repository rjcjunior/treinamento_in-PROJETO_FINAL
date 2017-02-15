class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  # GET /posts
  # GET /posts.json
  def index

      @post = Post.search(params)
      @postpaginate =Post.search(params).where(:post_id => nil).paginate(:page => params[:page], :per_page => 10).order('created_at DESC')
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @existe = VotosPost.exists?(user_id: current_user.id, post_id: @post.id)
    
    @finddown = VotosPost.find_by(votoPost: false, post_id: @post.id, user_id: current_user.id)
    
    @findup = VotosPost.find_by(votoPost: true, post_id: @post.id, user_id: current_user.id)
  end
  
  def votar
    a = params[:booleano]
    b = params[:post_id]
    c = params[:user_id]
    if !VotosPost.exists?(user_id: c, post_id: b)
      voto = VotosPost.new(:user_id => c, :post_id => b, :votoPost => a)
      voto.save
    else
      voto = VotosPost.find_by(user_id: c, post_id: b)
      voto.update(:user_id => c, :post_id => b, :votoPost => a)
    end
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.data = Time.now.utc
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
    
  end
  

    # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
         if @current_user.id != @post.user_id #Verificando q se o criador do post for igual ao que está colaborando 
            colaborador = UserPost.create(:user_id => @current_user.id, :post_id => @post.id) #criar um novo colaborador
            @ultimcolab = colaborador
         end
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:titulo, :conteudo, :data, :post_id, :tag)
    end
    
end

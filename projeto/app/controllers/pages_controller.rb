class PagesController < ApplicationController
 
 
  def pesquisa
          @post = Post.search(params).where(:post_id => nil).paginate(:page => params[:page], :per_page => 5).order('created_at DESC')
          @artigos = Artigo.search(params).paginate(:page => params[:page],:per_page => 5).order('created_at DESC')
  end
  

  def edit
  
  end
end

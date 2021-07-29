class Public::PostsController < ApplicationController
   before_action :move_to_signed_in
   
  def index
    @posts = Post.page(params[:page]).reverse_order
    
    @random = Post.order("RANDOM()").limit(6)
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
    
    @random = Post.order("RANDOM()").limit(6)
  end

  def new
    @post = Post.new

    @random = Post.order("RANDOM()").limit(6)
  end
  
  def create
    post = Post.new(post_params)
    post.save
    redirect_to posts_path
  end

  def edit
    @post = Post.find(params[:id])
    
    @random = Post.order("RANDOM()").limit(6)
  end
  
  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to post_path(post)
  end
  
  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path
  end
  
  private
  
  def post_params
    params.require(:post).permit(:post_title, :post_body, :image, :chinchilla_id)
  end
  
  def move_to_signed_in
    unless owner_signed_in?
      redirect_to  'home'
    end
  end
end

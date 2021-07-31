class Public::PostsController < ApplicationController
   before_action :move_to_signed_in
   before_action :ensure_owner, only: [:edit, :update, :destroy]
   
  def index
    @posts = Post.page(params[:page]).reverse_order
    
    @recommends = Post.order("RAND()").limit(6)
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
    
    @recommends = Post.order("RAND()").limit(6)
  end

  def new
    @post = Post.new

    @recommends = Post.order("RAND()").limit(6)
  end
  
  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "投稿に成功しました！"
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def edit
    @recommends = Post.order("RAND()").limit(6)
  end
  
  def update
    if @post.update(post_params)
      flash[:notice] = "投稿の更新に成功しました！"
      redirect_to post_path(@post)
    else
     @recommends = Post.order("RAND()").limit(6)
      render :edit
    end
  end
  
  def destroy
    @post.destroy
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
  
  def ensure_owner
    @post = Post.find(params[:id])
    redirect_to owner_path(current_owner) unless @post.chinchilla.owner == current_owner
  end
end

class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @posts = Post.page(params[:page]).reverse_order
  end
  
  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to admin_posts_path
  end
end

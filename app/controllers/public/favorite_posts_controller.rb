class Public::FavoritePostsController < ApplicationController
  def index
  end

  def create
    post = Post.find(params[:post_id])
    favorite = current_owner.favorite_posts.build(post_id: post.id)
    favorite.save
    redirect_to post_path(post)  
  end

  def destroy
    post = Post.find(params[:post_id])
    favorite = current_owner.favorite_posts.find_by(post_id: post.id)
    favorite.destroy
    redirect_to post_path(post)
  end
end

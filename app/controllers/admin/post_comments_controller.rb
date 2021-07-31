class Admin::PostCommentsController < ApplicationController
  before_action :authenticate_admin!
  def destroy
    PostComment.find_by(id: params[:id], post_id: params[:post_id]).destroy
    redirect_to admin_posts_path
  end
end

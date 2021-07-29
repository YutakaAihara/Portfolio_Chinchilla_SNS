class Public::OwnersController < ApplicationController
 before_action :move_to_signed_in
 
  def show
    @owner = Owner.find(params[:id])

    @random = Post.order("RANDOM()").limit(6)
  end

  def edit
    @owner = Owner.find(params[:id])

    @random = Post.order("RANDOM()").limit(6)
  end
  
  def update
    owner = Owner.find(params[:id])
    owner.update(owner_params)
    redirect_to owner_path(owner)
  end
  
  def withdrawal_confirmation
    @owner = Owner.find_by(id: params[:id])

    @random = Post.order("RANDOM()").limit(6)
  end
  
  def withdrawal
    owner = Owner.find_by(id: params[:id])
    byebug
    owner.update(join_status: false)
    reset_session
    redirect_to root_path
  end
  
  private
  
  def owner_params
    params.require(:owner).permit(:name, :email, :prefecture, :image, :introduction)
  end
  
  def move_to_signed_in
    unless owner_signed_in?
      redirect_to  'home'
    end
  end
end

class Public::OwnersController < ApplicationController

  def show
    @owner = Owner.find(params[:id])
  end

  def edit
    @owner = Owner.find(params[:id])
  end
  
  def update
    owner = Owner.find(params[:id])
    owner.update(owner_params)
    redirect_to owner_path(owner)
  end
  
  def withdrawal_confirmation
    @owner = Owner.find(params[:id])
  end
  
  def withdrawal
    owner = Owner.find(params[:id])
    owner.update(join_status: false)
    reset_session
    redirect_to root_path
  end
  
  private
  
  def owner_params
    params.require(:owner).permit(:name, :email, :prefecture, :image, :introduction)
  end
end

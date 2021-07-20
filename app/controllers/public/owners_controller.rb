class Public::OwnersController < ApplicationController

  def show
    @owner = current_owner
  end

  def edit
    @owner = current_owner
  end
  
  def update
    owner = current_owner
    owner.update(owner_params)
    redirect_to mypage_path
  end
  
  def withdrawal_confirmation
    @owner = current_owner
  end
  
  def withdrawal
    owner = current_owner
    owner.update(join_status: false)
    reset_session
    redirect_to root_path
  end
  
  private
  
  def owner_params
    params.require(:owner).permit(:name, :email, :prefecture, :image, :introduction)
  end
end

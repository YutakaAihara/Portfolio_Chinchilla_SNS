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
    redirect_to owner_path(owner)
  end
  
  private
  
  def owner_params
    params.require(:owner).permit(:name, :email, :prefecture, image)
  end
end

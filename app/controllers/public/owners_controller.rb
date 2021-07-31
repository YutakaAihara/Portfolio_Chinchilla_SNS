class Public::OwnersController < ApplicationController
 before_action :move_to_signed_in
 before_action :ensure_owner, only: [:edit, :update]
 
  def show
    @owner = Owner.find(params[:id])

   @randoms = Post.limit(6)
  end

  def edit
    @randoms = Post.limit(6)
  end
  
  def update
    if @owner.update(owner_params)
      flash[:notice] = "プロフィールの更新に成功しました！"
      redirect_to owner_path(@owner)
    else
      # @randoms = Post.limit(6)
      render :edit
    end
  end
  
  def withdrawal_confirmation
    @owner = Owner.find_by(id: params[:id])

    # @randoms = Post.limit(6)
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

  def ensure_owner
    @owner = Owner.find(params[:id])
    redirect_to owner_path(current_owner) unless @owner == current_owner
  end
end

class Public::OwnersController < ApplicationController
  include Commons
  before_action :recommend_posts
  before_action :same_prefecture_owners
 before_action :move_to_signed_in
 before_action :ensure_owner, only: [:edit, :update]
 
  def show
    @owner = Owner.find(params[:id])
    @favorite_chinchillas = @owner.favorite_chinchillas.page(params[:page]).reverse_order
  end

  def edit
  end
  
  def update
    if @owner.update(owner_params)
      flash[:notice] = "プロフィールの更新に成功しました！"
      redirect_to owner_path(@owner)
    else
      render :edit
    end
  end
  
  def withdrawal_confirmation
    @owner = Owner.find_by(id: params[:id])
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

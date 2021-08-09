class Public::HospitalsController < ApplicationController
  before_action :move_to_signed_in
  before_action :ensure_owner, only: [:edit, :update, :destroy]
  
  def index
    @hospitals = Hospital.page(params[:page]).reverse_order

    @recommends = Post.order("RANDOM()").limit(6)
    @same_prefecture_owners = Owner.where.not(id: current_owner.id).where(prefecture: current_owner.prefecture).order("RANDOM()").limit(3)
  end

  def show
    @hospital = Hospital.find(params[:id])
    gon.latitude = @hospital.latitude
    gon.longitude = @hospital.longitude
    
    @recommends = Post.order("RANDOM()").limit(6)
    @same_prefecture_owners = Owner.where.not(id: current_owner.id).where(prefecture: current_owner.prefecture).limit(3)
  end

  def new
    @hospital = Hospital.new

    @recommends = Post.order("RANDOM()").limit(6)
    @same_prefecture_owners = Owner.where.not(id: current_owner.id).where(prefecture: current_owner.prefecture).limit(3)
  end
  
  def create
    @hospital = current_owner.hospitals.build(hospital_params)
    if @hospital.save
      flash[:notice] = "病院のレビューが投稿されました！"
      redirect_to hospital_path(@hospital)
    else
      @recommends = Post.order("RANDOM()").limit(6)
      @same_prefecture_owners = Owner.where.not(id: current_owner.id).where(prefecture: current_owner.prefecture).limit(3)
      render :new
    end
  end

  def edit
    @recommends = Post.order("RANDOM()").limit(6)
    @same_prefecture_owners = Owner.where.not(id: current_owner.id).where(prefecture: current_owner.prefecture).limit(3)
  end
  
  def update
    if @hospital.update(hospital_params)
      flash[:notice] = "レビューの更新に成功しました！"
      redirect_to hospital_path(@hospital)
    else
      @recommends = Post.order("RANDOM()").limit(6)
      @same_prefecture_owners = Owner.where.not(id: current_owner.id).where(prefecture: current_owner.prefecture).limit(3)
      render :edit
    end
  end
  
  def destroy
    @hospital.destroy
    redirect_to hospitals_path
  end
  
  private
  
  def hospital_params
    params.require(:hospital).permit(:hospital_name, :address, :rate, :comment, :latitude, :longitude, :owner_id, hospital_images_images: [])
  end

  def move_to_signed_in
    unless owner_signed_in?
      redirect_to  'home'
    end
  end
  
  def ensure_owner
    @hospital = Hospital.find(params[:id])
    redirect_to owner_path(current_owner) unless @hospital.owner == current_owner
  end
end

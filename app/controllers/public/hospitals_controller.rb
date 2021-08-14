class Public::HospitalsController < ApplicationController
  include Commons
  before_action :recommend_posts
  before_action :same_prefecture_owners
  before_action :move_to_signed_in
  before_action :ensure_owner, only: [:edit, :update, :destroy]
  
  def index
    @hospitals = Hospital.page(params[:page]).reverse_order
  end

  def show
    @hospital = Hospital.find(params[:id])
    gon.latitude = @hospital.latitude
    gon.longitude = @hospital.longitude
  end

  def new
    @hospital = Hospital.new
  end
  
  def create
    @hospital = current_owner.hospitals.build(hospital_params)
    if @hospital.save
      flash[:notice] = "病院のレビューが投稿されました！"
      redirect_to hospital_path(@hospital)
    else
      render :new
    end
  end

  def edit
  end
  
  def update
    if @hospital.update(hospital_params)
      flash[:notice] = "レビューの更新に成功しました！"
      redirect_to hospital_path(@hospital)
    else
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

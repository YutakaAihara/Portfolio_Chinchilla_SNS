class Public::HospitalsController < ApplicationController
  before_action :move_to_signed_in
  before_action :ensure_owner, only: [:edit, :update, :destroy]
  
  def index
    @hospitals = Hospital.page(params[:page]).reverse_order

    @random = Post.order("RANDOM()").limit(6)
  end

  def show
    @hospital = Hospital.find(params[:id])
    gon.latitude = @hospital.latitude
    gon.longitude = @hospital.longitude
    
    @random = Post.order("RANDOM()").limit(6)
  end

  def new
    @hospital = Hospital.new

    @random = Post.order("RANDOM()").limit(6)
  end
  
  def create
    hospital = current_owner.hospitals.build(hospital_params)
    hospital.save!
    redirect_to hospital_path(hospital)
  end

  def edit
    @random = Post.order("RANDOM()").limit(6)
  end
  
  def update
    if @hospital.update(hospital_params)
      redirect_to hospital_path(hospital)
    else
      @random = Post.order("RANDOM()").limit(6)
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

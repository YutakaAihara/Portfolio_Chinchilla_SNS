class Public::HospitalsController < ApplicationController
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
    @hospital = Hospital.find(params[:id])
    
    @random = Post.order("RANDOM()").limit(6)
  end
  
  def update
    hospital = Hospital.find(params[:id])
    hospital.update(hospital_params)
    redirect_to hospital_path(hospital)
  end
  
  def destroy
    hospital = Hospital.find(params[:id])
    hospital.destroy
    redirect_to hospitals_path
  end
  
  private
  
  def hospital_params
    params.require(:hospital).permit(:hospital_name, :address, :rate, :comment, :latitude, :longitude, :image, :owner_id)
  end
  
  def move_to_signed_in
    unless owner_signed_in?
      redirect_to  'home'
    end
  end
end

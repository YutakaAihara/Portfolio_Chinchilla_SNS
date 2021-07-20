class Public::HospitalsController < ApplicationController
  def index
    @hospitals = Hospital.all
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
    hospital = current_owner.hospitals.build(hospital_params)
    hospital.save!
    redirect_to hospital_path(hospital)
  end

  def edit
    @hospital = Hospital.find(params[:id])
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
end

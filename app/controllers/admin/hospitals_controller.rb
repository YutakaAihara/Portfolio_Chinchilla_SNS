class Admin::HospitalsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @hospitals = Hospital.page(params[:page]).reverse_order
  end
  
  def destroy
    hospital = Hospital.find(params[:id])
    hospital.destroy
    redirect_to admin_hospitals_path
  end
end

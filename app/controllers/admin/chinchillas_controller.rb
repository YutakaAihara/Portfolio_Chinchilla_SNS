class Admin::ChinchillasController < ApplicationController
  before_action :authenticate_admin!
  def index
    @chinchillas = Chinchilla.page(params[:page]).reverse_order
  end
  
  def destroy
    chinchilla = Chinchilla.find(params[:id])
    chinchilla.destroy
    redirect_to admin_chinchillas_path
  end
end

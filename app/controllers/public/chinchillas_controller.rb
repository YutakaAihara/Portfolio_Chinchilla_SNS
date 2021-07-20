class Public::ChinchillasController < ApplicationController
  def index
    @chinchillas = Chinchilla.all
  end

  def new
    @chinchilla = Chinchilla.new
  end
  
  def create
    chinchilla = Chinchilla.new(chinchilla_params)
    if chinchilla.save
      redirect_to chinchilla_path(chinchilla)
    end
  end

  def show
    @chinchilla = Chinchilla.find(params[:id])
  end

  def edit
    @chinchilla = Chinchilla.find(params[:id])
  end
  
  def update
    chinchilla = Chinchilla.find(params[:id])
    if chinchilla.update(chinchilla_params)
      redirect_to chinchilla_path(chinchilla)
    end
  end
  
  def destroy
    chinchilla = Chinchilla.find(params[:id])
    if chinchilla.destroy
      redirect_to chinchillas_path
    end
  end
  
  private
  
  def chinchilla_params
    params.require(:chinchilla).permit(:name, :birthday, :sex, :fur_type, :introduction, :image, :owner_id)
  end
end

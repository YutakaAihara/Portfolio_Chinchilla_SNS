class Public::ChinchillasController < ApplicationController
  before_action :move_to_signed_in
  
  def index
    @chinchillas = Chinchilla.page(params[:page]).reverse_order

    @random = Post.order("RANDOM()").limit(6)
  end

  def new
    @chinchilla = Chinchilla.new

    @random = Post.order("RANDOM()").limit(6)
  end
  
  def create
    chinchilla = Chinchilla.new(chinchilla_params)
    if chinchilla.save
      redirect_to chinchilla_path(chinchilla)
    end
  end

  def show
    @chinchilla = Chinchilla.find(params[:id])

    @random = Post.order("RANDOM()").limit(6)
  end

  def edit
    @chinchilla = Chinchilla.find(params[:id])

    @random = Post.order("RANDOM()").limit(6)
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
  
  def move_to_signed_in
    unless owner_signed_in?
      redirect_to  'home'
    end
  end
end

class Public::ChinchillasController < ApplicationController
  before_action :move_to_signed_in
  before_action :ensure_owner, only: [:edit, :update, :destroy]
  
  def index
    @chinchillas = Chinchilla.page(params[:page]).reverse_order

    @recommends = Post.order("RANDOM()").limit(6)  
  end

  def new
    @chinchilla = Chinchilla.new

    @recommends = Post.order("RANDOM()").limit(6)  
  end
  
  def create
    @chinchilla = Chinchilla.new(chinchilla_params)
    if @chinchilla.save
      flash[:notice] = "チンチラが増えました！"
      redirect_to chinchilla_path(@chinchilla)
    else
      @recommends = Post.order("RANDOM()").limit(6)
      @chinchilla = Chinchilla.new
      render :new
    end
  end

  def show
    @chinchilla = Chinchilla.find(params[:id])
    
    @recommends = Post.order("RANDOM()").limit(6)
  end

  def edit
    @recommends = Post.order("RANDOM()").limit(6)
  end
  
  def update
    if @chinchilla.update(chinchilla_params)
      flash[:notice] = "チンチラの情報が更新されました！"
      redirect_to chinchilla_path(@chinchilla)
    else
    @recommends = Post.order("RANDOM()").limit(6)
      render :edit
    end
  end
  
  def destroy
    @chinchilla.destroy
    redirect_to owner_path(current_owner)
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
  
  def ensure_owner
    @chinchilla = Chinchilla.find(params[:id])
    redirect_to owner_path(current_owner) unless @chinchilla.owner == current_owner
  end
end

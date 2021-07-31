class Public::FavoriteChinchillasController < ApplicationController
  def index
  end

  def create
    @chinchilla = Chinchilla.find(params[:chinchilla_id])
    @favorite = current_owner.favorite_chinchillas.build(chinchilla_id: @chinchilla.id)
    @favorite.save
  end

  def destroy
    @chinchilla = Chinchilla.find(params[:chinchilla_id])
    @favorite = current_owner.favorite_chinchillas.find_by(chinchilla_id: @chinchilla.id)
    @favorite.destroy

  end
end

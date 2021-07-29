class Admin::OwnersController < ApplicationController
  def index
    @owners = Owner.page(params[:page]).reverse_order
  end
  
  def destroy
    owner = Owner.find(params[:id])
    owner.destroy
    redirect_to admin_owners_path
  end
end

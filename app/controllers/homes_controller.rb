class HomesController < ApplicationController
  before_action :move_to_owner
  def top
    @owner = Owner.new
  end
  
  private
    def move_to_owner
    if owner_signed_in?
      redirect_to  owner_path(current_owner)
    end
  end
end

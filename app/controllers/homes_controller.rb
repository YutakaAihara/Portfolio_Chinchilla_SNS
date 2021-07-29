class HomesController < ApplicationController
  def top
    @owner = Owner.new
  end
  
end

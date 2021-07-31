class HomesController < ApplicationController
  def top
    @owner = Owner.new
    @randoms = Post.order("RAND()").limit(6)
  end
  
end

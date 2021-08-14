module Commons
  extend ActiveSupport::Concern
  
  def recommend_posts
    @recommends = Post.order("RANDOM()").limit(6)
  end
  
  def same_prefecture_owners
    @same_prefecture_owners = Owner.where.not(id: current_owner.id).where(prefecture: current_owner.prefecture).order("RANDOM()").limit(3)
  end

end
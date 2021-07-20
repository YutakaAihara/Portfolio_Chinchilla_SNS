class Post < ApplicationRecord
  belongs_to :chinchilla
  has_many :post_comments, dependent: :destroy
  has_many :favorite_posts, dependent: :destroy
  attachment :image
  
  def favorited_by?(owner)
    favorite_posts.where(owner_id: owner.id).exists?
  end
end

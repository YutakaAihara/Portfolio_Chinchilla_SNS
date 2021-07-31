class Post < ApplicationRecord
  belongs_to :chinchilla
  has_many :post_comments, dependent: :destroy
  has_many :favorite_posts, dependent: :destroy
  attachment :image
  
  validates :post_title, presence: true,
                         length: { maximum: 20 }
  
  validates :post_body, length: { in: 2..140 }
  
                       
  
  def favorited_by?(owner)
    favorite_posts.where(owner_id: owner.id).exists?
  end
end

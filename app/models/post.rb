class Post < ApplicationRecord
  belongs_to :chinchilla
  has_many :post_comments, dependent: :destroy
  has_many :favorite_posts, dependent: :destroy
  attachment :image
  
  validates :post_title, presence: true,
                         length: { maximum: 20 }
  
  validaets :post_body, length: { in: 2..140 }
  
  validates :image_id, presence: true
                       
  
  def favorited_by?(owner)
    favorite_posts.where(owner_id: owner.id).exists?
  end
end

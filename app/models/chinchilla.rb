class Chinchilla < ApplicationRecord
  belongs_to :owner
  has_many :posts, dependent: :destroy
  has_many :favorite_chinchillas, dependent: :destroy
  
  attachment :image
  enum sex: { "オス": 0, "メス": 1 }
  
  def favorited_by?(owner)
    favorite_chinchillas.where(owner_id: owner.id).exists?
  end
end

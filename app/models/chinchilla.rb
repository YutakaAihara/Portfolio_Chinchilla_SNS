class Chinchilla < ApplicationRecord
  belongs_to :owner
  has_many :posts, dependent: :destroy
  has_many :favorite_chinchillas, dependent: :destroy
  
  validates :name, presence: true
  validates :birthday, presence: true
  validates :sex, presence: true
  validates :fur_type, presence: true
  validates :introduction, length: { maximum: 140 }
  
  
  attachment :image
  enum sex: { "オス": 0, "メス": 1 }
  
  def favorited_by?(owner)
    favorite_chinchillas.where(owner_id: owner.id).exists?
  end
  
  
end

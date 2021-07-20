class Chinchilla < ApplicationRecord
  belongs_to :owner
  has_many :posts, dependent: :destroy
  
  attachment :image
  enum sex: { "オス": 0, "メス": 1 }
end

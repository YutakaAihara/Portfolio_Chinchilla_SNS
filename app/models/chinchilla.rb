class Chinchilla < ApplicationRecord
  belongs_to :owner
  has_many :posts, dependent: :destroy
  
  attachment :image
end

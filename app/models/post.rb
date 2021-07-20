class Post < ApplicationRecord
  belongs_to :chinchilla
  has_many :post_comments, dependent: :destroy
  attachment :image
end

class Post < ApplicationRecord
  belongs_to :chinchilla
  attachment :image
end

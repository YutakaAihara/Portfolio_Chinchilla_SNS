class FavoriteChinchilla < ApplicationRecord
  belongs_to :owner
  belongs_to :chinchilla
end

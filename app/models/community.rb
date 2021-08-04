class Community < ApplicationRecord
  has_many :community_members
  has_many :owners, through: :community_members
  has_many :community_mmessages, dependent: :destroy
  validates :name, presence: true, uniqueness: true
  
  attachment :image
end

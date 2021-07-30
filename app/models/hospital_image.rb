class HospitalImage < ApplicationRecord
  belongs_to :hospital
  attachment :image
  
  validates :image_id, presence: true
  
end

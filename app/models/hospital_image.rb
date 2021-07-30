class HospitalImage < ApplicationRecord
  belongs_to :hospital
  attachment :image
  
  
end

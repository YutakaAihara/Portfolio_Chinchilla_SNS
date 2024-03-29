class Hospital < ApplicationRecord
  belongs_to :owner
  has_many :hospital_images, dependent: :destroy
  
  accepts_attachments_for :hospital_images, attachment: :image
  
  validates :hospital_name, presence: true
  
  validates :address, presence: true
  
  validates :rate, numericality: { less_than_or_equal_to: 5,
                                   greater_than_or_equal_to: 0 }, 
                   presence: true
  
  validates :comment, presence: true
                      
  
  geocoded_by :address
  after_validation :geocode
end

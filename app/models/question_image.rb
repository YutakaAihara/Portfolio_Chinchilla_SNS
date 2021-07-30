class QuestionImage < ApplicationRecord
  belongs_to :question
  attachment :image
  
  validates :image_id, presence: true
  
end

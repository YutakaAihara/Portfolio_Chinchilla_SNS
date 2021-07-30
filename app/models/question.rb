class Question < ApplicationRecord
  belongs_to :owner
  has_many :question_images, dependent: :destroy
  has_many :question_comments, dependent: :destroy
  accepts_attachments_for :question_images, attachment: :image
  
  validates :question_title, presence: true,
                             length: { in: 2..30 }
                             
  validates :question_body, presence: true
  
  validates :solution_status, presence: true,
                              inclusion: { in: [true, false] }
                          
end

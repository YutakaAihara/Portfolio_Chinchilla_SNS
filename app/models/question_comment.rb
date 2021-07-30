class QuestionComment < ApplicationRecord
  belongs_to :owner
  belongs_to :question
  
  validates :comment, presence: true
end

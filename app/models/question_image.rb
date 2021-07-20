class QuestionImage < ApplicationRecord
  belongs_to :question
  attachment :image
end

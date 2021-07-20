class Question < ApplicationRecord
  belongs_to :owner
  has_many :question_images, dependent: :destroy
  accepts_attachments_for :question_images, attachment: :image
end

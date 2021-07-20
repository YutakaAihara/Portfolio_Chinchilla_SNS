class Question < ApplicationRecord
  belongs_to :owner
  has_maby :question_images, dependent: :destroy
  accepts_attachments_for :hospital_images, attachment: :image
end

class PostComment < ApplicationRecord
  belongs_to :owner
  belongs_to :post
  
  validates :comment, presence: true,
                      length: { in: 2..140 }
end

class Owner < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :chinchillas, dependent: :destroy
  has_many :hospitals, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :question_comments, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  attachment :image
  
  
  # 退会後のログインを拒否
  def active_for_authentication?
    super && (self.join_status == true)
  end
end

class Review < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :hotspring, dependent: :destroy
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :hotspring_id, presence: true
  validates :comment, presence: true, length: { maximum: 140 }


  
end

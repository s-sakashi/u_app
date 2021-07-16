class Review < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :hotspring, dependent: :destroy
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :hotspring_id, presence: true
  validates :star, presence: true, numericality: {
    greater_than_or_equal_to: 1, less_than_or_equal_to: 5}
  validates :comment, length: { maximum: 50 }


  
end

class Hotspring < ApplicationRecord
    validates :name, presence: true, length: { maximum: 10 }
    validates :address, presence: true, length: {maximum: 50 }
    validates :ph, presence: true, numericality: {
        greater_than_or_equal_to: 0, less_than_or_equal_to: 14}
    validates :quality, presence: true, length: { maximum: 10 }


    scope :search, -> (search_params) do
        return if search_params.blank?
        name_like(search_params[:name])
    end

    scope :name_like, -> (name) { where('name LIKE ?', "%#{name}%") if name.present? }
end
class Hotspring < ApplicationRecord
    validates :name, presence: true, length: { maximum: 10 }
    validates :address, presence: true, length: {maximum: 50 }
    validates :ph, presence: true, numericality: {
        greater_than_or_equal_to: 0, less_than_or_equal_to: 14}
    validates :quality, presence: true, length: { maximum: 10 }


    scope :search, -> (search_params) do
        return if search_params.blank?
        name_like(search_params[:name])
        .ph_from(search_params[:ph_min])
        .ph_to(search_params[:ph_max])
    end

    scope :name_like, -> (name) { where('name LIKE ?', "%#{name}%") if name.present? }
    scope :ph_from, -> (ph_min) { where(' ? <= ph', ph_min) if ph_min.present? }
    scope :ph_to, -> (ph_max) { where(' ph <= ?', ph_max) if ph_max.present? }
end
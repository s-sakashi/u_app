class Hotspring < ApplicationRecord
    validates :name, presence: true, length: { maximum: 10 }
    validates :address, presence: true, length: {maximum: 50 }
    validates :ph, presence: true, numericality: {
        greater_than_or_equal_to: 0, less_than_or_equal_to: 14}
    validates :quality, presence: true, length: { maximum: 10 }

    scope :search, -> (seach_params) do
        return if search_params.blank?

    end

    scope :name_link, -> (name) { where('name LIKE ?', "%#{name}") if name.present? }
    scope :name_address, -> (address) { where('address LIKE ?', "%#{address}") if address.present? }
    scope :ph_link, -> (ph) { where('ph LIKE ?', "%#{ph}") if ph.present? }
    scope :quality_link, -> (qualiyu) { where('quality LIKE ?', "%#{quality}") if quality.present? }
end
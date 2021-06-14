class Hotspring < ApplicationRecord
    validates :name, presence: true, length: { maximum: 10 }
    validates :address, presence: true, length: {maximum: 50 }
    validates :ph, presence: true, numericality: {
        greater_than_or_equal_to: 0, less_than_or_equal_to: 14}
    validates :quality, presence: true, length: { maximum: 10 }


    def self.search(search)
        if search
            Hotspring.where(['name LIKE ?', "%#{search}%"])
        else
            Hotspring.all
        end
    end
end
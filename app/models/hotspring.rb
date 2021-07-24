class Hotspring < ApplicationRecord
    has_many :reviews, dependent: :destroy
    has_many :users, through: :reviews
    has_many_attached :images
    validates :name, presence: true, length: { maximum: 10 }
    validates :address, presence: true, length: {maximum: 50 }
    validates :ph, presence: true, numericality: {
        greater_than_or_equal_to: 0, less_than_or_equal_to: 14}
    validates :quality, presence: true, length: { maximum: 10 }

    def average_score
        unless self.reviews.empty?
           self.reviews.average(:star).round(1)
        else
            2.5
        end
    end

    def percentage_score
        unless self.reviews.empty?
            self.reviews.average(:star).round(1).to_f*100/5
         else
             50.0
         end
    end

    scope :search, -> (search_params) do
        return if search_params.blank?
        if search_params[:address] == "---"
            search_params[:address] = ""
        end
        name_like(search_params[:name])
        .address_like(search_params[:address])
        .ph_from(search_params[:ph_min])
        .ph_to(search_params[:ph_max])
    end

    scope :name_like, -> (name) { where('name LIKE ?', "%#{name}%") if name.present? }
    scope :address_like, -> (address) { where('address LIKE ?', "%#{address}%") if address.present? }
    scope :ph_from, -> (ph_min) { where(' ? <= ph', ph_min) if ph_min.present? }
    scope :ph_to, -> (ph_max) { where(' ph <= ?', ph_max) if ph_max.present? }
end
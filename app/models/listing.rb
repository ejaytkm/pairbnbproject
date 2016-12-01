class Listing < ApplicationRecord

	belongs_to :user
	has_many :reservations
	mount_uploader :image, ImageUploader	

	scope :city, ->(city) { where("city ILIKE ?", "%#{city}%") }
	scope :bedrooms, ->(query) { where("number_of_bedrooms = ?", query) }
	scope :occupants, ->(query) { where("max_occupants = ?", query)}
	scope :bathrooms, ->(query) { where("number_of_bathrooms = ?", query) }
	scope :min_price, ->(min_price) { where("price >= ?", min_price) }
 	scope :max_price, ->(max_price) { where("price <= ?", max_price) }

end
 
class Listing < ApplicationRecord

	belongs_to :user
	has_many :reservations
	mount_uploader :image, ImageUploader	


	# def self.city_search(query)
	# 	if query.present?
	# 		where("city ilike :q", q: "#{query}")
	# 	end
	# end

	# def self.price_search(query)
	# 	if query.present?
	# 		where("price ilike :q", q: "#{query}")
	# 	end
	# end

	# def self.max_bedrooms_search(query)
	# 	if query.present?
	# 		where("number_of_bedrooms = :q", q: "#{query}")
	# 	end
	# end

	# def self.max_bathrooms_search(query)
	# 	if query.present?
	# 		where("number_of_bathrooms = :q", q: "#{query}")
	# 	end
	# end 

	scope :city, ->(city) { where("city ILIKE ?", "%#{city}%") }
	scope :bedrooms, ->(query) { where("number_of_bedrooms = ?", query) }
	scope :occupants, ->(query) { where("max_occupants = ?", query)}
	scope :bathrooms, ->(query) { where("number_of_bathrooms = ?", query) }
	scope :min_price, ->(min_price) { where("price >= ?", min_price) }
 	scope :max_price, ->(max_price) { where("price <= ?", max_price) }
 	
end
 
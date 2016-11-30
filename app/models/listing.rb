class Listing < ApplicationRecord

	belongs_to :user
	has_many :reservations
	mount_uploader :image, ImageUploader	

	def self.city_search(query)
		if query.present?
			where("city ilike :q", q: "#{query}")
		end
	end

	def self.price_search(query)
		if query.present?
			where("price ilike :q", q: "#{query}")
		end
	end

	def self.max_occupants_search(query)
		if query.present?
			where("max_occupants = :q", q: "#{query}")
		end
	end

	def self.max_bathrooms_search(query)
		if query.present?
			where("number_of_bathrooms = :q", q: "#{query}")
		end
	end 

end
 
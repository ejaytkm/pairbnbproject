class Listing < ApplicationRecord

	belongs_to :user
	has_many :reservations
	mount_uploader :image, ImageUploader	

end

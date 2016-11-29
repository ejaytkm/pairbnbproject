class Payment < ApplicationRecord
	has_one :reservation
end

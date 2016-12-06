FactoryGirl.define do 
	factory :user do
		email 		"@gmail.com"
    password 	"unique123"
    roles 		"landlord"
  end


  factory :listing do 
  	city "Jakarta"
  	max_occupants "29"
  	number_of_bathrooms 3
  	number_of_bedrooms 6
  end

end 
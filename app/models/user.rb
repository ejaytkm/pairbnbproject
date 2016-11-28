class User < ApplicationRecord
  include Clearance::User
  has_many :listings 
  has_one :profile

end

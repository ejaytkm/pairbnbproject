class User < ApplicationRecord
  include Clearance::User
  has_many :listings 

  def initialize 
  	self.roles ||= "tenant" 
  end 
end

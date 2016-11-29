# Load the Rails application.
require_relative 'application'
Braintree::Configuration.environment = :sandbox
Braintree::Configuration.merchant_id = ENV["MERCHANT_ID"]
Braintree::Configuration.public_key = ENV["PUBLIC_KEY"]
Braintree::Configuration.private_key = ENV["PRIVATE_KEY"]

# Initialize the Rails application.
Rails.application.initialize!

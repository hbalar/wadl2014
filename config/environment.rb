# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Depot1::Application.initialize!

config.action_mailer.delivery_method = :smtp | :sendmail | :test


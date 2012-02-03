# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Testapp::Application.initialize!

# Configuration for using SendGrid on Heroku
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :user_name => "app2576834@heroku.com",
  :password => "9ox3w2fj",
  :domain => "phideillinois.heorkuapp.com",
  :address => "smtp.sendgrid.net",
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}
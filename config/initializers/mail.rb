ActionMailer::Base.raise_delivery_errors = true

ActionMailer::Base.smtp_settings = {
  :user_name => Rails.application.credentials.dig( :mailgun, :username ),
  :password => Rails.application.credentials.dig( :mailgun, :password ),
  :domain => Rails.application.credentials.dig( :mailgun, :domain ),
  :address => 'smtp.mailgun.org',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.default charset: "utf-8"
# Use this hook to configure devise mailer, warden hooks and so forth.
# Many of these configuration options can be set straight in your model.
Devise.setup do |config|
  config.secret_key = ENV['DEVISE_SECRET']

  config.mailer_sender = 'no-reply@thisisnotajoke.com'
  config.mailer = 'MyMailer'
  require 'devise/orm/active_record'

  config.paranoid = true
  config.skip_session_storage = [:http_auth]

  config.stretches = Rails.env.test? ? 1 : 10

  config.reconfirmable = true

  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 8..72
  config.reset_password_within = 6.hours

  config.sign_out_via = :delete
end
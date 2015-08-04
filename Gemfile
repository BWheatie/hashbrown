source 'https://rubygems.org'
ruby "2.2.2"

gem 'rails-api'

gem 'acts_as_follower'
gem 'activerecord'
gem 'actionmailer'
gem 'active_model_serializers', '0.10.0.rc2'
gem 'devise'
gem 'doorkeeper'
gem 'faker'
gem 'pg'
gem 'puma'
gem 'kaminari'
gem 'skylight'
gem 'rack-cors', :require => 'rack/cors'
gem 'rspec-rails'

group :test do
  gem 'simplecov', :require => false
  gem "codeclimate-test-reporter", require: nil
end

group :production do
  gem 'rails_12factor'
end
group :development, :test do
  gem 'byebug'
  gem 'foreman'
  gem 'factory_girl_rails'
end

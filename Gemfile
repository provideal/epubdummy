source 'http://rubygems.org'

gem 'rails', '3.1.3'
gem 'mongoid', '~> 2.3.0'
gem 'bson_ext', '~> 1.4.0'
gem 'jquery-rails'
gem 'mini_magick', '~> 3.3.0'
gem 'carrierwave', '~> 0.5.0'
gem 'carrierwave-mongoid', '~> 0.1.3', require: 'carrierwave/mongoid'
gem 'simple_form', '~> 1.5.0'
gem 'bcrypt-ruby'
gem 'redcarpet'

group :assets do
  gem 'sass-rails',   '~> 3.1.5'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end

group :development do
  # see http://stackoverflow.com/questions/7522781/rails-3-1-is-very-slow-in-development-mode-because-of-assets-what-to-do
  # see https://github.com/wavii/rails-dev-tweaks
  gem 'rails-dev-tweaks', '~> 0.5'
end

group :test do
  # Pretty printed test output
  gem 'turn', '~> 0.8.3', :require => false
end

group :production do
  gem 'therubyracer'
end

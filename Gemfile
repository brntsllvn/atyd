source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5.1'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.15'

# gem 'bootstrap-sass', '~> 3.3.6'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets

gem 'bootswatch-rails'

gem 'font-awesome-sass', '~> 4.5.0'

gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'

gem 'bower-rails'

# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

gem "figaro"

gem 'carrierwave', github: 'carrierwaveuploader/carrierwave'
gem 'carrierwave-aws'
gem "mini_magick"

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# mailchimp api wrapper
gem 'gibbon', '~> 2.2', '>= 2.2.1'

# Use Unicorn as the app server
# gem 'unicorn'

gem 'omniauth', '~> 1.2.2'
gem 'omniauth-google-oauth2'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  gem "rspec-rails"
  gem 'factory_girl_rails'
  gem 'byebug'
end

  gem 'vcr', group: :test
  gem 'webmock', group: :test

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  gem 'guard-rspec', require: false
  gem 'guard-livereload', '~> 2.5', require: false
  gem 'pry-rails'
  gem "binding_of_caller"
  gem "better_errors"
end

group :production do
  gem 'rails_12factor'
end

gem "puma"


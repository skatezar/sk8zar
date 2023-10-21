source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.6'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.3', '>= 6.0.3.5'
# Use sqlite3 as the database for Active Record
# gem 'sqlite3', '~> 1.4'

#pagy for implementing infinite scroll
gem 'pagy', '~> 3.5'

#admin acc
gem 'rails_admin', '~> 2.1'

#monitoring
gem 'appsignal'

#for mailer
gem 'postmark-rails'


#sidekiq
gem 'sidekiq'
gem 'sidekiq-failures', '~> 1.0'

#pg search
gem 'pg_search', '~> 2.3.0'

#slider for price
gem 'nouislider-rails'


#for filters
gem 'acts-as-taggable-on', '~> 7.0'

gem 'jquery-rails'

#for mailer
gem 'letter_opener', group: :development

gem 'geocoder'

gem 'pg'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :production do
  # Use Redis adapter to run Action Cable in production
  gem 'redis', '~> 4.0'
end

#LW setup
gem 'autoprefixer-rails'
gem 'font-awesome-sass', '~> 5.6.1'
gem 'simple_form'


#devise setup
gem 'devise'

#env file
gem 'dotenv-rails', groups: [:development, :test]

# Cloudinary
gem 'cloudinary', '~> 1.16.0'

#pundit for user authorization
gem 'pundit'

gem 'exponent-server-sdk'

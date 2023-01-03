source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.3'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'carrierwave', '>= 2.0.0.rc', '< 3.0'
gem 'mini_magick', '~> 4.5', '>= 4.5.1'
gem 'simple_form', '~> 4.1'
gem 'bootstrap', '~> 4.2.1'
gem 'haml-rails', '~> 2.0'
gem 'rails_admin', '~> 1.4', '>= 1.4.2'
gem 'devise', '~> 4.6', '>= 4.6.2'
gem 'jquery-rails'
gem 'httparty', '~> 0.21.0'
gem 'whenever', '~> 1.0'
gem 'sidekiq', '~> 5.2', '>= 5.2.7'
gem 'ckeditor', '~> 4.3'
gem 'nokogiri', '~> 1.10', '>= 1.10.3'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'letter_opener', '~> 1.7'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

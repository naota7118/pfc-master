# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.5.1"
gem "rails", "~> 5.2.4", ">= 5.2.4.2"
gem "mysql2", ">= 0.4.4", "< 0.6.0"
gem "puma", "~> 3.11"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "coffee-rails", "~> 4.2"
gem "turbolinks", "~> 5"
gem "jbuilder", "~> 2.5"
gem "bootsnap", ">= 1.1.0", require: false

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'spring'
  gem 'pry-rails'
  gem 'sprockets'
  gem 'rspec-rails'
  gem 'capistrano'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano-rbenv'
  gem 'capistrano3-unicorn'
  gem "factory_bot_rails"
  gem "faker"
  gem 'rubocop', '~> 1.0', require: false
  gem "rubocop-packaging"
  gem "rubocop-performance"
  gem "rubocop-rails"
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'webdrivers', '~> 3.0'
  gem "rspec_junit_formatter"
end

group :production, :staging do
  gem "unicorn"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem "haml-rails", ">= 1.0", "<= 2.0.1"
gem "font-awesome-sass"
gem "bootstrap", "~> 5.0.1"
gem "jquery-rails"
gem "carrierwave"
gem "mini_magick"
gem "devise"
gem "chartkick"
gem "groupdate"
gem "font-awesome-rails"
gem "chart-js-rails"
gem "gon"
gem "simple_calendar", "~> 2.0"
gem "kaminari"
gem "ed25519"
gem "bcrypt_pbkdf"
gem "sassc", "~>2.1.0"
gem "mini_racer"
gem "bcrypt", "~> 3.1.7"
gem "autoprefixer-rails"
gem 'fog-aws'
gem 'twitter'
gem 'impressionist', '~>1.6.1'
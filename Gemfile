source 'https://rubygems.org'
ruby '2.0.0'
gem 'rails', '4.0.0'
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'jquery-ui-rails'
#gem 'turbolinks'
gem 'jbuilder', '~> 1.2'
#gem 'compass-rails', '~> 2.0.alpha.0'
gem 'omniauth'
gem 'omniauth-facebook', '1.4.0'
#gem 'omniauth', '~> 1.0.2'
#gem 'omniauth-facebook', '~> 1.2.0'
gem 'rack-facebook-method-fix'
#gem 'rack-facebook-signed-request'
gem 'rack-facebook-signed-request', :git => 'git://github.com/cmer/rack-facebook-signed-request.git'
gem 'rack-p3p'
gem 'bootstrap-sass', '~> 2.3.2.2'
gem "font-awesome-rails"
gem "bourbon"
#gem 'mysql2'
gem 'pg'
gem 'mini_fb'
gem 'httparty'
gem 'useragent'
#gem 'airbrake'
#gem 'json', '1.8.0'
#gem 'newrelic_rpm'
gem 'sidekiq'
gem 'rack-timeout'
#gem 'unicorn'
#gem 'sinatra', '>= 1.3.0', :require => nil
#gem 'clockwork'
#gem 'kaminari'

group :development do
  gem 'better_errors'
  gem 'binding_of_caller', :platforms=>[:mri_19, :mri_20, :rbx]
  gem 'guard-bundler'
  gem 'guard-rails'
  gem 'guard-rspec'
  gem 'hub', :require=>nil
  gem 'quiet_assets'
  gem 'rb-fchange', :require=>false
  gem 'rb-fsevent', :require=>false
  gem 'rb-inotify', :require=>false
  gem 'bullet'
  gem 'ruby-growl'
end
group :development, :test do
  gem 'factory_girl_rails'
  gem 'rspec-rails'
  gem 'dotenv-rails'
  gem 'debugger'
end
group :test do
  gem 'database_cleaner', '1.0.1'
  gem 'mocha'
  gem 'vcr'
  gem 'webmock'
  gem 'timecop'
end
group :production do
  gem 'rails_12factor'
end

require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_record/railtie"
require "action_controller/railtie"
#require "action_mailer/railtie"
require "sprockets/railtie"
#require "rack-facebook-method-fix"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module FbApp
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'
    config.time_zone = 'America/Argentina/Buenos_Aires'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :es

    config.autoload_paths += %W(#{config.root}/lib #{config.root}/lib/ext)
    #config.middleware.use Rack::Facebook::MethodFix, secret_id: ENV['FACEBOOK_SECRET']
    config.middleware.insert_before ActionDispatch::Session::CookieStore, Rack::P3p
    config.middleware.use Rack::Facebook::SignedRequest, app_id: ENV['FACEBOOK_APP_ID'], secret: ENV['FACEBOOK_SECRET'], inject_facebook: false

    # Add the fonts path
    config.assets.paths << Rails.root.join('app', 'assets', 'fonts')

    # Precompile additional assets
    config.assets.precompile += %w( .svg .eot .woff .ttf )

    config.action_view.field_error_proc = proc {|html, instance| html }
  end
end

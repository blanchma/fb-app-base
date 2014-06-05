#require 'sidekiq'
#
#if Rails.env == "production" && false #TODO: test this later
#  Sidekiq.configure_server do |config|
#    config.redis = ENV['REDIS_URL']
#
#    database_url = ENV['DATABASE_URL']
#    if database_url
#      ENV['DATABASE_URL'] = "#{database_url}?pool=25"
#      ActiveRecord::Base.establish_connection
#    end
#  end
#end
#
#Sidekiq.configure_client do |config|
#  config.redis = { url: ENV["REDIS_URL"], namespace: 'sidekiq' }
#  config.redis = { :size => 1 }
#end
#
#Sidekiq.configure_server do |config|
#  config.redis = { url: ENV["REDIS_URL"], namespace: 'sidekiq' }
#  config.redis = { :size => 2 }
#end

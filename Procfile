web: bundle exec unicorn -E production -p $PORT -c ./config/unicorn.rb 
worker: bundle exec sidekiq -C config/sidekiq.yml
clock: bundle exec clockwork lib/clock.rb

MiniFB.enable_logging if Rails.env.development?
MiniFB.disable_logging if Rails.env.production?

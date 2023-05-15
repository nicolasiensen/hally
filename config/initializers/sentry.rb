Sentry.init do |config|
  config.dsn = 'https://9b68bc425cd44fd28bf24d7717b50adc@o502709.ingest.sentry.io/4505189702303744'
  config.breadcrumbs_logger = [:active_support_logger, :http_logger]

  # Set traces_sample_rate to 1.0 to capture 100%
  # of transactions for performance monitoring.
  # We recommend adjusting this value in production.
  config.traces_sample_rate = 1.0
  # or
  config.traces_sampler = lambda do |context|
    true
  end
end

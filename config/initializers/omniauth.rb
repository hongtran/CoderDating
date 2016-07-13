 OmniAuth.config.logger = Rails.logger

  Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, '1783167828637174', 'c37d583e3b6dd5be0c0220e5dfbc9e3c'
  end
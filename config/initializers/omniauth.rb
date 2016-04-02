OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, 
  !Rails.env.production? ? ENV["GOOGLE_CLIENT_ID_DEV"] : ENV["GOOGLE_CLIENT_ID_PROD"],
  !Rails.env.production? ? ENV["GOOGLE_CLIENT_SECRET_DEV"] : ENV["GOOGLE_CLIENT_SECRET_PROD"]

  OmniAuth.config.full_host = Rails.env.production? ? 'https://acetheyellowdog.com' : 'http://localhost:3000'
end
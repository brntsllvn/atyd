OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, 
  !Rails.env.production? ? ENV["GOOGLE_CLIENT_ID_DEV"] : ENV["GOOGLE_CLIENT_ID_PROD"],
  !Rails.env.production? ? ENV["GOOGLE_CLIENT_SECRET_DEV"] : ENV["GOOGLE_CLIENT_SECRET_PROD"]

  # config/initialisers/omniauth.rb
  OmniAuth.config.full_host = Rails.env.production? ? 'https://atyd.herokuapp.com' : 'http://localhost:3000'
end
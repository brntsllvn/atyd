CarrierWave.configure do |config|
  config.storage    = :aws
  config.aws_bucket = ENV['aws_bucket']
  config.aws_acl    = :public_read
  # config.asset_host = 'http://example.com'
  config.aws_authenticated_url_expiration = 60 * 60 * 24 * 365

  config.aws_credentials = {
    access_key_id:     ENV['aws_access_key_id'],
    secret_access_key: ENV['aws_secret_key'],
    region:            ENV['aws_region']
    }

  if Rails.env.test?
    config.storage = :file
    config.enable_processing = false
  end
end
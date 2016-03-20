require 'omniauth'
require 'capybara/rspec'
require "rack_session_access/capybara"

OmniAuth.config.test_mode = true

OmniAuth.config.mock_auth[:default] = OmniAuth::AuthHash.new({
  :provider => 'default',
  :uid => '123545'
})

OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
    :provider => "google",
    :uid => "123456789",
    :info => {
        :name => "John Doe",
        :email => "john@company_name.com",
        :first_name => "John",
        :last_name => "Doe",
        :image => "https://lh3.googleusercontent.com/url/photo.jpg"
    },
    :credentials => {
        :token => "some_token",
        :refresh_token => "another_token",
        :expires_at => 1354920555,
        :expires => true
    },
    :extra => {
        :raw_info => {
            :sub => "123456789",
            :email => "user@domain.example.com",
            :email_verified => true,
            :name => "John Doe",
            :given_name => "John",
            :family_name => "Doe",
            :profile => "https://plus.google.com/123456789",
            :picture => "https://lh3.googleusercontent.com/url/photo.jpg",
            :gender => "male",
            :birthday => "0000-06-25",
            :locale => "en",
            :hd => "company_name.com"
        },
        :id_info => {
            "iss" => "accounts.google.com",
            "at_hash" => "HK6E_P6Dh8Y93mRNtsDB1Q",
            "email_verified" => "true",
            "sub" => "10769150350006150715113082367",
            "azp" => "APP_ID",
            "email" => "jsmith@example.com",
            "aud" => "APP_ID",
            "iat" => 1353601026,
            "exp" => 1353604926,
            "openid_id" => "https://www.google.com/accounts/o8/id?id=ABCdfdswawerSDFDsfdsfdfjdsf"
        }
    }
})


RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
    expectations.syntax = [:expect]
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
    mocks.verify_doubled_constant_names = true
  end

  config.filter_run :focus
  config.run_all_when_everything_filtered = true

  config.disable_monkey_patching!
  config.expose_dsl_globally = true

  if config.files_to_run.one?
    config.default_formatter = 'doc'
  end

  config.order = :random
  config.color = true
  config.tty = true
  config.formatter = :documentation

  Kernel.srand config.seed
  
  config.after(:suite) do
    FileUtils.rm_rf(Dir["#{Rails.root}/public/uploads"])
  end
end

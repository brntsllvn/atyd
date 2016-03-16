require 'capybara/rspec'
require "rack_session_access/capybara"

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

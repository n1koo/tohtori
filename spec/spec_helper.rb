require 'lita/rspec'
Lita.version_3_compatibility_mode = false
ENV['ENV'] = 'test'
require File.expand_path('../../lita_config', __FILE__)

require 'fakeweb'
FakeWeb.allow_net_connect = false

require 'pry-byebug'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  config.disable_monkey_patching!
  config.order = :random
  Kernel.srand config.seed
end

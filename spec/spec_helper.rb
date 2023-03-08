require "bundler/setup"
require "dotenv/load"
require "beaconcha"
require "vcr"

Dir[File.expand_path("spec/support/**/*.rb")].sort.each { |f| require f }

VCR.configure do |c|
  c.hook_into :webmock
  c.cassette_library_dir = "spec/fixtures/cassettes"
  c.default_cassette_options = { record: ENV["NO_VCR"] == "true" ? :all : :new_episodes,
                                 match_requests_on: [:method, :uri, VCRMultipartMatcher.new] }
  c.filter_sensitive_data("<BEACONCHA_API_KEY>") { Beaconcha.configuration.api_key }
  c.filter_sensitive_data("<BEACONCHA_URI_BASE>") { Beaconcha.configuration.uri_base }
end

RSpec.configure do |c|
  # Enable flags like --only-failures and --next-failure
  c.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  c.disable_monkey_patching!

  c.expect_with :rspec do |rspec|
    rspec.syntax = :expect
  end

  c.before(:all) do
    Beaconcha.configure do |config|
      config.api_key = ENV["BEACONCHA_API_KEY"] #optional
      config.uri_base = ENV.fetch("BEACONCHA_URI_BASE")
    end
  end
end

RSPEC_ROOT = File.dirname __FILE__

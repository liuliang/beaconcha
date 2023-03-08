require "httparty"

require_relative "beaconcha/client"
require_relative "beaconcha/epoch"
require_relative "beaconcha/slot"
require_relative "beaconcha/validator"
require_relative "beaconcha/sync_committee"
require_relative "beaconcha/execution"
require_relative "beaconcha/eth_store"
require_relative "beaconcha/rocketpool"
require_relative "beaconcha/misc"
require_relative "beaconcha/version"

module Beaconcha
  class Error < StandardError; end
  class ConfigurationError < Error; end

  class Configuration
    attr_writer :api_key, :uri_base
    attr_accessor :api_version

    DEFAULT_API_VERSION = "v1".freeze

    def initialize
      @api_key = nil
      @api_version = DEFAULT_API_VERSION
      @uri_base = nil
    end

    def api_key
      @api_key
    end

    def uri_base
      return @uri_base if @uri_base

      error_text = "Beaconcha uri base missing! See https://github.com/liuliang/beaconcha#usage"
      raise ConfigurationError, error_text
    end
  end

  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= Beaconcha::Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end

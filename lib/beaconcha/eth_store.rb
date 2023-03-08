module Beaconcha
  class EthStore
    def initialize(api_key: nil, uri_base: nil)
      Beaconcha.configuration.api_key = api_key if api_key
      Beaconcha.configuration.uri_base = uri_base if uri_base
    end

    def retrieve(day:)
      Beaconcha::Client.get(path: "/ethstore/#{day}")
    end
  end
end

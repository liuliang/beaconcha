module Beaconcha
  class Rocketpool
    def initialize(api_key: nil, uri_base: nil)
      Beaconcha.configuration.api_key = api_key if api_key
      Beaconcha.configuration.uri_base = uri_base if uri_base
    end

    def validator(id:)
      Beaconcha::Client.get(path: "/rocketpool/validator/#{id}")
    end

    def stats
      Beaconcha::Client.get(path: "/rocketpool/stats")
    end
  end
end

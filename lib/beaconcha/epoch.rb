module Beaconcha
  class Epoch
    def initialize(api_key: nil, uri_base: nil)
      Beaconcha.configuration.api_key = api_key if api_key
      Beaconcha.configuration.uri_base = uri_base if uri_base
    end

    def retrieve(id:)
      Beaconcha::Client.get(path: "/epoch/#{id}")
    end

    def slots(id:)
      Beaconcha::Client.get(path: "/epoch/#{id}/slots")
    end
  end
end

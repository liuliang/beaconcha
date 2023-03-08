module Beaconcha
  class Slot
    def initialize(api_key: nil, uri_base: nil)
      Beaconcha.configuration.api_key = api_key if api_key
      Beaconcha.configuration.uri_base = uri_base if uri_base
    end

    def retrieve(id:)
      Beaconcha::Client.get(path: "/slot/#{id}")
    end

    def attestations(id:)
      Beaconcha::Client.get(path: "/slot/#{id}/attestations")
    end

    def attesterslashings(id:)
      Beaconcha::Client.get(path: "/slot/#{id}/attesterslashings")
    end

    def deposits(id:)
      Beaconcha::Client.get(path: "/slot/#{id}/deposits")
    end

    def proposerslashings(id:)
      Beaconcha::Client.get(path: "/slot/#{id}/proposerslashings")
    end

    def voluntaryexits(id:)
      Beaconcha::Client.get(path: "/slot/#{id}/voluntaryexits")
    end
  end
end

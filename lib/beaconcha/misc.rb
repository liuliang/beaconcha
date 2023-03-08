module Beaconcha
  class Misc
    def initialize(api_key: nil, uri_base: nil)
      Beaconcha.configuration.api_key = api_key if api_key
      Beaconcha.configuration.uri_base = uri_base if uri_base
    end

    def healthz
      Beaconcha::Client.get_without_version(path: "/healthz")
    end

    def healthz_loadbalancer
      Beaconcha::Client.get_without_version(path: "/healthz-loadbalancer")
    end

    def chart(chart:)
      Beaconcha::Client.get(path: "/chart/#{chart}")
    end

    def graffitiwall(slot: nil)
      Beaconcha::Client.get(path: "/graffitiwall", query: { slot: slot })
    end
  end
end

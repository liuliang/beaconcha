module Beaconcha
  class SyncCommittee
    def initialize(api_key: nil, uri_base: nil)
      Beaconcha.configuration.api_key = api_key if api_key
      Beaconcha.configuration.uri_base = uri_base if uri_base
    end

    def retrieve(period:)
      Beaconcha::Client.get(path: "/sync_committee/#{period}")
    end
  end
end

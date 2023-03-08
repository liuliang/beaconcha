module Beaconcha
  class Execution
    def initialize(api_key: nil, uri_base: nil)
      Beaconcha.configuration.api_key = api_key if api_key
      Beaconcha.configuration.uri_base = uri_base if uri_base
    end

    def eth1deposit(txhash:)
      Beaconcha::Client.get(path: "/eth1deposit/#{txhash}")
    end

    def address(address:, token: nil)
      Beaconcha::Client.get(path: "/execution/address/#{address}", query: { token: token })
    end

    def block(block_number:)
      Beaconcha::Client.get(path: "/execution/block/#{block_number}")
    end

    def gasnow
      Beaconcha::Client.get(path: "/execution/gasnow")
    end

    def produced(id:, limit: nil, offset: nil)
      Beaconcha::Client.get(path: "/execution/#{id}/produced",
                            query: { limit: limit, offset: offset })
    end
  end
end

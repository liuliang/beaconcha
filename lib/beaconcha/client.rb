module Beaconcha
  class Client
    def initialize(api_key: nil, uri_base: nil)
      Beaconcha.configuration.api_key = api_key if api_key
      Beaconcha.configuration.uri_base = uri_base if uri_base
    end

    def epoch
      @epoch ||= Beaconcha::Epoch.new
    end

    def slot
      @slot ||= Beaconcha::Slot.new
    end

    def validator
      @validator ||= Beaconcha::Validator.new
    end

    def sync_committee
      @sync_committee ||= Beaconcha::SyncCommittee.new
    end

    def execution
      @execution ||= Beaconcha::Execution.new
    end

    def eth_store
      @eth_store ||= Beaconcha::EthStore.new
    end

    def misc
      @misc ||= Beaconcha::Misc.new
    end

    def rocketpool
      @rocketpool ||= Beaconcha::Rocketpool.new
    end

    def self.get(path:, query: {})
      HTTParty.get(
        uri(path: path),
        query: query&.compact,
        headers: headers
      )
    end

    def self.get_without_version(path:, query: {})
      HTTParty.get(
        uri_without_version(path: path),
        query: query&.compact,
        headers: headers
      )
    end

    def self.post(path:, parameters:)
      HTTParty.post(
        uri(path: path),
        headers: headers,
        body: parameters&.compact&.to_json
      )
    end

    private_class_method def self.uri(path:)
      "#{Beaconcha.configuration.uri_base}/api/#{Beaconcha.configuration.api_version}#{path}"
    end

    private_class_method def self.uri_without_version(path:)
      "#{Beaconcha.configuration.uri_base}/api#{path}"
    end

    private_class_method def self.headers
      {
        "Content-Type" => "application/json",
        "apikey" => Beaconcha.configuration.api_key.to_s
      }
    end
  end
end

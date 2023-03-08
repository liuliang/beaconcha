module Beaconcha
  class Validator
    def initialize(api_key: nil, uri_base: nil)
      Beaconcha.configuration.api_key = api_key if api_key
      Beaconcha.configuration.uri_base = uri_base if uri_base
    end

    def eth1(address:, limit: nil, offset: nil)
      Beaconcha::Client.get(path: "/validator/eth1/#{address}",
                            query: { limit: limit, offset: offset })
    end

    def leaderboard
      Beaconcha::Client.get(path: "/validator/leaderboard")
    end

    def stats(id:)
      Beaconcha::Client.get(path: "/validator/stats/#{id}")
    end

    def retrieve(id:)
      Beaconcha::Client.get(path: "/validator/#{id}")
    end

    def attestationeffectiveness(id:)
      Beaconcha::Client.get(path: "/validator/#{id}/attestationeffectiveness")
    end

    def attestationefficiency(id:)
      Beaconcha::Client.get(path: "/validator/#{id}/attestationefficiency")
    end

    def attestations(id:)
      Beaconcha::Client.get(path: "/validator/#{id}/attestations")
    end

    def balancehistory(id:, latest_epoch: nil, limit: nil, offset: nil)
      Beaconcha::Client.get(path: "/validator/#{id}/balancehistory",
                            query: { latest_epoch: latest_epoch,
                                     limit: limit, offset: offset })
    end

    def deposits(id:)
      Beaconcha::Client.get(path: "/validator/#{id}/deposits")
    end

    def execution_performance(id:)
      Beaconcha::Client.get(path: "/validator/#{id}/execution/performance")
    end

    def incomedetailhistory(id:)
      Beaconcha::Client.get(path: "/validator/#{id}/incomedetailhistory")
    end

    def performance(id:)
      Beaconcha::Client.get(path: "/validator/#{id}/performance")
    end

    def proposals(id:, epoch: nil)
      Beaconcha::Client.get(path: "/validator/#{id}/proposals", query: { epoch: epoch })
    end

    def queue
      Beaconcha::Client.get(path: "/validators/queue")
    end
  end
end

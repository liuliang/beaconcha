RSpec.describe Beaconcha::Validator do
  describe "#validator" do
    describe "#eth1" do
      let(:address) { "0x70af49c6d84b605b5c9a18490b5b826126bbf41c" }
      let(:limit) { 2 }
      let(:cassette) { "validator_eth1" }

      it "succeeds" do
        VCR.use_cassette(cassette) do
          response = Beaconcha::Client.new.validator.eth1(address: address, limit: limit)
          r = JSON.parse(response.body)
          expect(r["status"]).to eq("OK")
          expect(r["data"].size).to eq(2)
        end
      end
    end

    describe "#leaderboard" do
      let(:cassette) { "validator_leaderboard" }

      it "succeeds" do
        VCR.use_cassette(cassette) do
          response = Beaconcha::Client.new.validator.leaderboard
          r = JSON.parse(response.body)
          expect(r["status"]).to eq("OK")
        end
      end
    end

    describe "#stats" do
      let(:validator_id) { 1000 }
      let(:cassette) { "validator_stats" }

      it "succeeds" do
        VCR.use_cassette(cassette) do
          response = Beaconcha::Client.new.validator.stats(id: validator_id)
          r = JSON.parse(response.body)
          expect(r["status"]).to eq("OK")
        end
      end
    end

    describe "#retrieve" do
      let(:validator_id) { 1000 }
      let(:cassette) { "validator_retrieve" }

      it "succeeds" do
        VCR.use_cassette(cassette) do
          response = Beaconcha::Client.new.validator.retrieve(id: validator_id)
          r = JSON.parse(response.body)
          expect(r["status"]).to eq("OK")
        end
      end
    end

    describe "#attestationeffectiveness" do
      let(:validator_id) { 1000 }
      let(:cassette) { "validator_attestationeffectiveness" }

      it "succeeds" do
        VCR.use_cassette(cassette) do
          response = Beaconcha::Client.new.validator.attestationeffectiveness(id: validator_id)
          r = JSON.parse(response.body)
          expect(r["status"]).to eq("OK")
        end
      end
    end

    describe "#attestationefficiency" do
      let(:validator_id) { 1000 }
      let(:cassette) { "validator_attestationefficiency" }

      it "succeeds" do
        VCR.use_cassette(cassette) do
          response = Beaconcha::Client.new.validator.attestationefficiency(id: validator_id)
          r = JSON.parse(response.body)
          expect(r["status"]).to eq("OK")
        end
      end
    end

    describe "#attestations" do
      let(:validator_id) { 1000 }
      let(:cassette) { "validator_attestations" }

      it "succeeds" do
        VCR.use_cassette(cassette) do
          response = Beaconcha::Client.new.validator.attestations(id: validator_id)
          r = JSON.parse(response.body)
          expect(r["status"]).to eq("OK")
        end
      end
    end

    describe "#balancehistory" do
      let(:validator_id) { 1000 }
      let(:cassette) { "validator_balancehistory" }

      it "succeeds" do
        VCR.use_cassette(cassette) do
          response = Beaconcha::Client.new.validator.balancehistory(id: validator_id)
          r = JSON.parse(response.body)
          expect(r["status"]).to eq("OK")
        end
      end
    end

    describe "#deposits" do
      let(:validator_id) { 1000 }
      let(:cassette) { "validator_deposits" }

      it "succeeds" do
        VCR.use_cassette(cassette) do
          response = Beaconcha::Client.new.validator.deposits(id: validator_id)
          r = JSON.parse(response.body)
          expect(r["status"]).to eq("OK")
        end
      end
    end

    describe "#execution_performance" do
      let(:validator_id) { 368_411 }
      let(:cassette) { "validator_execution_performance" }

      it "succeeds" do
        VCR.use_cassette(cassette) do
          response = Beaconcha::Client.new.validator.execution_performance(id: validator_id)
          r = JSON.parse(response.body)
          expect(r["status"]).to eq("OK")
        end
      end
    end

    describe "#incomedetailhistory" do
      let(:validator_id) { 1000 }
      let(:cassette) { "validator_incomedetailhistory" }

      it "succeeds" do
        VCR.use_cassette(cassette) do
          response = Beaconcha::Client.new.validator.incomedetailhistory(id: validator_id)
          r = JSON.parse(response.body)
          expect(r["status"]).to eq("OK")
        end
      end
    end

    describe "#performance" do
      let(:validator_id) { 1000 }
      let(:cassette) { "validator_performance" }

      it "succeeds" do
        VCR.use_cassette(cassette) do
          response = Beaconcha::Client.new.validator.performance(id: validator_id)
          r = JSON.parse(response.body)
          expect(r["status"]).to eq("OK")
        end
      end
    end

    describe "#proposals" do
      let(:validator_id) { 501_577 }
      let(:epoch_id) { 185_993 }
      let(:cassette) { "validator_proposals" }

      it "succeeds" do
        VCR.use_cassette(cassette) do
          response = Beaconcha::Client.new.validator.proposals(id: validator_id, epoch: epoch_id)
          r = JSON.parse(response.body)
          expect(r["status"]).to eq("OK")
        end
      end
    end

    describe "#queue" do
      let(:cassette) { "validator_queue" }

      it "succeeds" do
        VCR.use_cassette(cassette) do
          response = Beaconcha::Client.new.validator.queue
          r = JSON.parse(response.body)
          expect(r["status"]).to eq("OK")
        end
      end
    end
  end
end

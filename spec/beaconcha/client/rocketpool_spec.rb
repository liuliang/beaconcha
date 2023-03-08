RSpec.describe Beaconcha::Rocketpool do
  describe "#rocketpool" do
    describe "#stats", :vcr do
      let(:cassette) { "rocketpool_stats" }

      it "succeeds" do
        VCR.use_cassette(cassette) do
          response = Beaconcha::Client.new.rocketpool.stats
          r = JSON.parse(response.body)
          expect(r["status"]).to eq("OK")
        end
      end
    end

    describe "#validator", :vcr do
      let(:validator_id) { 10_000 }
      let(:cassette) { "rocketpool_validator" }

      it "succeeds" do
        VCR.use_cassette(cassette) do
          response = Beaconcha::Client.new.rocketpool.validator(id: validator_id)
          r = JSON.parse(response.body)
          expect(r["status"]).to eq("OK")
        end
      end
    end
  end
end

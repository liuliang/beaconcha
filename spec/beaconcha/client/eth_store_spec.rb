RSpec.describe Beaconcha::EthStore do
  describe "#eth_store" do
    describe "#retrieve" do
      let(:day) { "latest" }
      let(:cassette) { "eth_store_retrieve" }

      it "succeeds" do
        VCR.use_cassette(cassette) do
          response = Beaconcha::Client.new.eth_store.retrieve(day: day)
          r = JSON.parse(response.body)
          expect(r["status"]).to eq("OK")
        end
      end
    end
  end
end

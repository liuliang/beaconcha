RSpec.describe Beaconcha::SyncCommittee do
  describe "#sync_committee" do
    describe "#retrieve" do
      let(:period) { "latest" }
      let(:cassette) { "sync_committee_retrieve" }

      it "succeeds" do
        VCR.use_cassette(cassette) do
          response = Beaconcha::Client.new.sync_committee.retrieve(period: period)
          r = JSON.parse(response.body)
          expect(r["status"]).to eq("OK")
        end
      end
    end
  end
end

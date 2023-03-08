RSpec.describe Beaconcha::Epoch do
  describe "#epoch" do
    describe "#slots", :vcr do
      let(:epoch_id) { 18_924 }
      let(:cassette) { "epoch_slots" }

      it "succeeds" do
        VCR.use_cassette(cassette) do
          response = Beaconcha::Client.new.epoch.slots(id: epoch_id)
          r = JSON.parse(response.body)
          expect(r["status"]).to eq("OK")
        end
      end
    end

    describe "#retrieve" do
      let(:epoch_id) { 18_924 }
      let(:cassette) { "epoch_retrieve" }

      it "succeeds" do
        VCR.use_cassette(cassette) do
          response = Beaconcha::Client.new.epoch.retrieve(id: epoch_id)
          r = JSON.parse(response.body)
          expect(r["status"]).to eq("OK")
        end
      end
    end
  end
end

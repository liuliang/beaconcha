RSpec.describe Beaconcha::Slot do
  describe "#slot" do
    describe "#retrieve" do
      let(:slot_id) { 100 }
      let(:cassette) { "slot_retrieve" }

      it "succeeds" do
        VCR.use_cassette(cassette) do
          response = Beaconcha::Client.new.slot.retrieve(id: slot_id)
          r = JSON.parse(response.body)
          expect(r["status"]).to eq("OK")
        end
      end
    end

    describe "#attestations", :vcr do
      let(:slot_id) { 100 }
      let(:cassette) { "slot_attestations" }

      it "succeeds" do
        VCR.use_cassette(cassette) do
          response = Beaconcha::Client.new.slot.attestations(id: slot_id)
          r = JSON.parse(response.body)
          expect(r["status"]).to eq("OK")
        end
      end
    end

    describe "#attesterslashings", :vcr do
      let(:slot_id) { 17_112 }
      let(:cassette) { "slot_attesterslashings" }

      it "succeeds" do
        VCR.use_cassette(cassette) do
          response = Beaconcha::Client.new.slot.attesterslashings(id: slot_id)
          r = JSON.parse(response.body)
          expect(r["status"]).to eq("OK")
        end
      end
    end

    describe "#deposits", :vcr do
      let(:slot_id) { 4_664_391 }
      let(:cassette) { "slot_deposits" }

      it "succeeds" do
        VCR.use_cassette(cassette) do
          response = Beaconcha::Client.new.slot.deposits(id: slot_id)
          r = JSON.parse(response.body)
          expect(r["status"]).to eq("OK")
        end
      end
    end

    describe "#proposerslashings", :vcr do
      let(:slot_id) { 22_374 }
      let(:cassette) { "slot_proposerslashings" }

      it "succeeds" do
        VCR.use_cassette(cassette) do
          response = Beaconcha::Client.new.slot.proposerslashings(id: slot_id)
          r = JSON.parse(response.body)
          expect(r["status"]).to eq("OK")
        end
      end
    end

    describe "#voluntaryexits TODO", :vcr do
      let(:slot_id) { 100 }
      let(:cassette) { "slot_voluntaryexits" }

      it "succeeds" do
        VCR.use_cassette(cassette) do
          response = Beaconcha::Client.new.slot.voluntaryexits(id: slot_id)
          r = JSON.parse(response.body)
          expect(r["status"]).to eq("OK")
        end
      end
    end
  end
end

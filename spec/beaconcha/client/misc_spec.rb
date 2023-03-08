RSpec.describe Beaconcha::Misc do
  describe "#misc" do
    describe "#healthz", :vcr do
      let(:cassette) { "misc_healthz" }

      it "succeeds" do
        VCR.use_cassette(cassette) do
          response = Beaconcha::Client.new.misc.healthz
          expect(response.body).to match(/^OK/)
        end
      end
    end

    describe "#healthz_loadbalancer", :vcr do
      let(:cassette) { "misc_healthz_loadbalancer" }

      it "succeeds" do
        VCR.use_cassette(cassette) do
          response = Beaconcha::Client.new.misc.healthz_loadbalancer
          expect(response.body).to match(/^OK/)
        end
      end
    end

    describe "#graffitiwall", :vcr do
      let(:cassette) { "misc_graffitiwall" }

      it "succeeds" do
        VCR.use_cassette(cassette) do
          response = Beaconcha::Client.new.misc.graffitiwall
          r = JSON.parse(response.body)
          expect(r["status"]).to eq("OK")
        end
      end
    end
  end
end

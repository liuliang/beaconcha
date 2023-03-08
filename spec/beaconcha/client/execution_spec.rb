RSpec.describe Beaconcha::Execution do
  describe "#execution" do
    describe "#eth1deposit", :vcr do
      let(:txhash) { "0x9acf943be8ccdbfbb4f22467bd37b9de66e6ac9ddf883cd966da4f0903273d0d" }
      let(:cassette) { "execution_eth1deposit" }

      it "succeeds" do
        VCR.use_cassette(cassette) do
          response = Beaconcha::Client.new.execution.eth1deposit(txhash: txhash)
          r = JSON.parse(response.body)
          expect(r["status"]).to eq("OK")
        end
      end
    end

    describe "#address" do
      let(:address) { "0xe51d8371b3d6a79b4748f42b18eec05b524a729c" }
      let(:cassette) { "execution_address" }

      it "succeeds" do
        VCR.use_cassette(cassette) do
          response = Beaconcha::Client.new.execution.address(address: address)
          r = JSON.parse(response.body)
          expect(r["status"]).to eq("OK")
        end
      end
    end

    describe "#block" do
      let(:block_number) { 10_000 }
      let(:cassette) { "execution_block" }

      it "succeeds" do
        VCR.use_cassette(cassette) do
          response = Beaconcha::Client.new.execution.block(block_number: block_number)
          r = JSON.parse(response.body)
          expect(r["status"]).to eq("OK")
        end
      end
    end

    describe "#gasnow" do
      let(:cassette) { "execution_gasnow" }

      it "succeeds" do
        VCR.use_cassette(cassette) do
          response = Beaconcha::Client.new.execution.gasnow
          r = JSON.parse(response.body)
          expect(r["code"]).to eq(200)
        end
      end
    end

    describe "#produced" do
      let(:id) { 10_000 }
      let(:limit) { 2 }
      let(:cassette) { "execution_produced" }

      it "succeeds" do
        VCR.use_cassette(cassette) do
          response = Beaconcha::Client.new.execution.produced(id: id, limit: limit)
          r = JSON.parse(response.body)
          expect(r["status"]).to eq("OK")
        end
      end
    end
  end
end

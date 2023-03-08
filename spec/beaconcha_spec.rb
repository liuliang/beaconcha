RSpec.describe Beaconcha do
  it "has a version number" do
    expect(Beaconcha::VERSION).not_to be nil
  end

  describe "#configure" do
    let(:api_key) { "abc123" }
    let(:api_version) { "v2" }
    let(:uri_base) { "https://beaconcha.in" }

    before do
      Beaconcha.configure do |config|
        config.api_key = api_key
        config.api_version = api_version
        config.uri_base = uri_base
      end
    end

    it "returns the config" do
      expect(Beaconcha.configuration.api_key).to eq(api_key)
      expect(Beaconcha.configuration.api_version).to eq(api_version)
      expect(Beaconcha.configuration.uri_base).to eq(uri_base)
    end

    context "without an uri base" do
      let(:uri_base) { nil }

      it "raises an error" do
        expect { Beaconcha.configuration.uri_base }.to raise_error(Beaconcha::ConfigurationError)
      end
    end
  end
end

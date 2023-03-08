RSpec.describe Beaconcha::Client do
  it "can be initialized" do
    expect { Beaconcha::Client.new }.not_to raise_error
  end
end

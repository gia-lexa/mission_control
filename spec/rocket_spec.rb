require_relative '../lib/rocket'

RSpec.describe Rocket do
  before(:each) do
    @rocket = Rocket.new
  end

  it 'initializes with the correct fuel capacity' do
    expect(@rocket.fuel_capacity).to eq(1_514_100)
  end

  it 'initializes with the correct burn rate' do
    expect(@rocket.burn_rate).to eq(168_233)
  end

  it 'initializes with the correct average speed' do
    expect(@rocket.average_speed).to eq(1500)
  end

  it 'initializes with the correct travel distance' do
    expect(@rocket.travel_distance).to eq(160)
  end
end

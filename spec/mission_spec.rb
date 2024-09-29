require_relative '../lib/mission'

RSpec.describe Mission do
  before(:each) do
    @mission = Mission.new("Test Mission")
  end

  it 'completes a successful mission' do
    allow(@mission).to receive(:gets).and_return('y')
    
    allow(@mission).to receive(:abort_mission?).and_return(false)
    allow(@mission).to receive(:explode_mission?).and_return(false)
  
    @mission.engage_afterburner
    @mission.release_support_structures
    @mission.perform_cross_checks
    @mission.launch
  
    expect(@mission.distance_traveled).to eq(160)
    expect(@mission.fuel_burned).to eq(1_514_100)
    expect(@mission.exploded).to be false
    expect(@mission.aborted).to be false
  end

  it 'engages the afterburner successfully' do
    # Simulate user input for 'y'
    allow(@mission).to receive(:gets).and_return('y')
    expect { @mission.engage_afterburner }.to change { @mission.instance_variable_get(:@stages_completed) }.by(1)
  end

  it 'aborts the mission if conditions are met' do
    allow(@mission).to receive(:gets).and_return('y')
    allow(@mission).to receive(:abort_mission?).and_return(true)
    
    @mission.launch
    
    expect(@mission.aborted).to be true
    expect(@mission.distance_traveled).to eq(0)
  end

  it 'aborts the mission after the afterburner stage' do
    allow(@mission).to receive(:gets).and_return('y')
    
    allow(@mission).to receive(:abort_mission?).and_return(true)
    allow(@mission).to receive(:explode_mission?).and_return(false)
  
    @mission.engage_afterburner
    @mission.launch
  
    expect(@mission.aborted).to be true
    expect(@mission.distance_traveled).to eq(0)
    expect(@mission.fuel_burned).to eq(0)
  end  

  it 'explodes during the launch if conditions are met' do
    allow(@mission).to receive(:gets).and_return('y')
    allow(@mission).to receive(:explode_mission?).and_return(true)
    
    @mission.launch
    
    expect(@mission.exploded).to be true
    expect(@mission.distance_traveled).to be_between(1, 160).inclusive
  end

  it 'performs a successful launch' do
    allow(@mission).to receive(:gets).and_return('y')
    allow(@mission).to receive(:abort_mission?).and_return(false)
    allow(@mission).to receive(:explode_mission?).and_return(false)
    
    @mission.launch
    
    expect(@mission.distance_traveled).to eq(160)
    expect(@mission.fuel_burned).to eq(1_514_100)
  end
end

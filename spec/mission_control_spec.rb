require_relative '../lib/mission_control'

RSpec.describe MissionControl do
  before(:each) do
    @mission_control = MissionControl.new
  end

  it 'creates a new mission and executes it' do
    mission = double('Mission')
    allow(mission).to receive(:engage_afterburner)
    allow(mission).to receive(:release_support_structures)
    allow(mission).to receive(:perform_cross_checks)
    allow(mission).to receive(:launch)
    allow(mission).to receive(:mission_summary)
    
    expect { @mission_control.run_mission(mission) }.not_to raise_error
  end

  it 'prints the final summary' do
    mission = double('Mission', distance_traveled: 100, fuel_burned: 50000, time_elapsed: 120, aborted: false, exploded: false)
    allow(@mission_control).to receive(:continue_missions?).and_return(false)
    allow(@mission_control).to receive(:run_mission).and_return(mission)
    
    @mission_control.instance_variable_set(:@missions, [mission]) # Set missions for testing

    expect { @mission_control.final_summary }.to output(/Total distance traveled: 100 km/).to_stdout
  end
end

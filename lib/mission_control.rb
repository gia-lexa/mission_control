require_relative 'mission'

class MissionControl
  def initialize
    @missions = []
  end

  def start
    puts "Welcome to Mission Control!"
    loop do
      puts "What is the name of this mission?"
      mission_name = gets.chomp
      mission = Mission.new(mission_name)
      run_mission(mission)
      @missions << mission
      mission.mission_summary
      break unless continue_missions?
    end
    final_summary
  end

  def run_mission(mission)
    mission.engage_afterburner
    mission.release_support_structures
    mission.perform_cross_checks
    mission.launch
  end

  def continue_missions?
    puts "Would you like to run another mission? (Y/n)"
    gets.chomp.downcase == 'y'
  end

  def final_summary
    total_distance = @missions.sum(&:distance_traveled)
    total_fuel = @missions.sum(&:fuel_burned)
    total_time = @missions.sum(&:time_elapsed)
    total_aborts = @missions.count(&:aborted)
    total_explosions = @missions.count(&:exploded)

    puts "Final Summary:"
    puts "  Total distance traveled: #{total_distance} km"
    puts "  Total fuel burned: #{total_fuel} liters"
    puts "  Total flight time: #{format_time(total_time)}"
    puts "  Total aborts: #{total_aborts}"
    puts "  Total explosions: #{total_explosions}"
  end

  def format_time(minutes)
    hours = (minutes / 60).to_i
    mins = (minutes % 60).to_i
    "#{hours}:#{format('%02d', mins)}"
  end
end

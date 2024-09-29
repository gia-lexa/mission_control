require_relative 'rocket'

class Mission
  attr_reader :name, :distance_traveled, :fuel_burned, :time_elapsed

  def initialize(name)
    @name = name
    @rocket = Rocket.new
    @stages_completed = 0
    @aborted = false
    @exploded = false
    @distance_traveled = 0
    @fuel_burned = 0
    @time_elapsed = 0
  end

  def engage_afterburner
    puts "Engage afterburner? (Y/n)"
    return unless gets.chomp.downcase == 'y'

    puts "Afterburner engaged!"
    @stages_completed += 1
  end

  def release_support_structures
    puts "Release support structures? (Y/n)"
    return unless gets.chomp.downcase == 'y'

    puts "Support structures released!"
    @stages_completed += 1
  end

  def perform_cross_checks
    puts "Perform cross-checks? (Y/n)"
    return unless gets.chomp.downcase == 'y'

    puts "Cross-checks performed!"
    @stages_completed += 1
  end

  def launch
    puts "Launch? (Y/n)"
    return unless gets.chomp.downcase == 'y'

    if abort_mission?
      abort_launch
    elsif explode_mission?
      explode_launch
    else
      perform_launch
    end
  end

  def mission_summary
    puts "Mission summary:"
    puts "  Total distance traveled: #{@distance_traveled} km"
    puts "  Total fuel burned: #{@fuel_burned} liters"
    puts "  Flight time: #{format_time(@time_elapsed)}"
    puts "  Mission aborted: #{@aborted}"
    puts "  Mission exploded: #{@exploded}"
  end

  private

  def abort_mission?
    rand(3).zero? && @stages_completed == 1
  end

  def explode_mission?
    rand(5).zero?
  end

  def abort_launch
    puts "Mission aborted!"
    @aborted = true
    @distance_traveled = 0
    @time_elapsed = 0
  end

  def explode_launch
    puts "Rocket exploded!"
    @exploded = true
    @distance_traveled = rand(1..@rocket.travel_distance)
    @fuel_burned = (@distance_traveled / @rocket.travel_distance.to_f) * @rocket.fuel_capacity
    @time_elapsed = (@distance_traveled / @rocket.average_speed.to_f) * 60
  end

  def perform_launch
    puts "Launched!"
    @distance_traveled = @rocket.travel_distance
    @fuel_burned = @rocket.fuel_capacity
    @time_elapsed = (@rocket.travel_distance / @rocket.average_speed.to_f) * 60
  end

  def format_time(minutes)
    hours = (minutes / 60).to_i
    mins = (minutes % 60).to_i
    "#{hours}:#{format('%02d', mins)}"
  end
end

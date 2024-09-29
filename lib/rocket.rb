class Rocket
  attr_reader :fuel_capacity, :burn_rate, :average_speed, :travel_distance
  
  def initialize
    @fuel_capacity = 1_514_100 # liters
    @burn_rate = 168_233 # liters per minute
    @average_speed = 1500 # km/h
    @travel_distance = 160 # km
  end
end

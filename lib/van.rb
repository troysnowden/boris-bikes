require 'garage'
require 'docking_station'

class Van

  def initialize
    @garage = Garage.new
  end
  
  def collect_bikes_from_station(docking_station)
    broken_bikes = docking_station.release_broken_bikes_for_van
    broken_bikes.each do |bike|
      @garage.fix_bike(bike)
    end
    collect_bikes_from_garage(broken_bikes, docking_station)
  end

  def collect_bikes_from_garage(fixed_bikes, docking_station)
    docking_station.receive_bikes_from_van(fixed_bikes)
  end

end
#Classes

#Person
#Bike - is_working?
#Docking Station - release_bike

class Bike
  def initialize
    @working = true
  end

  def is_working?
    @working
  end
end

class DockingStation
  def release_bike(bike)
    puts "Bike released"
    return bike
  end
end

class Person
end

my_bike = Bike.new
docking_station_1 = DockingStation.new
docking_station_1.release_bike(my_bike)




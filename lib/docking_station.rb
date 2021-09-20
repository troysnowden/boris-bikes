class DockingStation
  attr_reader :bike

  def initialize(bike)
    @bike = bike
  end

  def release_bike
    @bike
  end

  def dock_bike(bike)
    @bike = bike
    return "Your bike has been stored"
  end

end
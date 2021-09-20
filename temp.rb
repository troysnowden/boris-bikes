class DockingStation
  
  def initialize(bike)
    @bike = bike
  end

  def release_bike
    @bike
  end

end

class Bike

  def initialize
    @working = true
  end
  
  def working?
    @working
  end
  
end




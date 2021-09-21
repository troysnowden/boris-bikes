class DockingStation

  def initialize(bike)
    @docked_bikes = []
    @bike = bike
    @docked_bikes_total = @docked_bikes.length
    @capacity = 20
  end

  def release_bike
    if @docked_bikes_total > 0
      @docked_bikes_total -= 1
      bike = @docked_bikes.pop
      bike
    else
      raise "There are no bikes to release"
    end
  end

  def dock_bike(bike)
    if @docked_bikes_total < @capacity
      @docked_bikes_total += 1
      @docked_bikes.push(bike)
      bike
    else
      raise "There is no room for this bike"
    end
  end

end
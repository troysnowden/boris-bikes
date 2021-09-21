class DockingStation

  def initialize
    @docked_bikes_total = 3
  end

  def release_bike
    if @docked_bikes_total > 0
      @docked_bikes_total -= 1
      Bike.new
    else
      raise "There are no bikes to release"
    end
  end

end
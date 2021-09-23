class DockingStation

  attr_reader :DEFAULT_CAPACITY

  def initialize(bike, capacity = 20)
    @docked_bikes = []
    @bike = bike
    @docked_bikes_total = @docked_bikes.length
    @DEFAULT_CAPACITY = capacity
  end

  def release_bike 
    if !empty?
      while true do
        rand_index = rand(0..(@docked_bikes_total-1))
        remove_bike = @docked_bikes[rand_index]
        if remove_bike.working?
          @docked_bikes_total -= 1
          @docked_bikes.delete_at(rand_index)
          return remove_bike
          break
        end
      end
    else 
      raise "There are no bikes to release"
    end 
  end

  def dock_bike(bike, working = true)
    if !full?
      if !working
        bike.report_bike
      end
      @docked_bikes_total += 1
      @docked_bikes.push(bike)
      bike
    else
      raise "There is no room for this bike"
    end
  end

  def release_broken_bikes_for_van 
    if !empty?
      @docked_bikes.filter{|b| !b.working?}
    else 
      raise "There are no bikes to release"
    end 
  end

  def receive_bikes_from_van(bikes)
    bikes.each do |bike|
      if !full?
        @docked_bikes_total += 1
        @docked_bikes.push(bike)
      else
        raise "There is no room for this bike"
      end
    end
  end

  private 

  def full?
    @docked_bikes_total + 1 > @DEFAULT_CAPACITY
  end

  def empty?
    @docked_bikes_total - 1 < 0
  end

end
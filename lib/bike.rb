class Bike

  def initialize
    @working = true
  end

  def report_bike
    @working = false
  end

  def working?
    @working
  end

  def fix_bike
    @working = true
  end

end
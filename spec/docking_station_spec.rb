require 'docking_station'
require 'bike'

describe DockingStation do

  before(:each) do 
    @new_bike = Bike.new
    @docking_station = DockingStation.new(@new_bike)
  end

  it 'docking station responds to release_bike method' do
    
    expect(@docking_station).to respond_to(:release_bike)
  end

  it 'docking station releases bike' do
    @docking_station.dock_bike(Bike.new)
    result = @docking_station.release_bike
    expect(result.is_a? Bike).to eq(true)
    expect(result.working?).to eq(true)
  end

  it 'docking station should not release a bike if there are none available' do
    expect{@docking_station.release_bike}.to raise_error("There are no bikes to release")
  end

  it 'docking station should not add a bike if it is at capacity' do
    (@docking_station.DEFAULT_CAPACITY).times do
      @docking_station.dock_bike(Bike.new)
    end
    expect{@docking_station.dock_bike(@new_bike)}.to raise_error("There is no room for this bike")
  end

  it 'should set default capacity as a parameter' do
    @docking_station = DockingStation.new(@new_bike, 5)
    expect(@docking_station.DEFAULT_CAPACITY).to eq(5)
  end

  it "will update a bike to broken on return" do
    result = @docking_station.dock_bike(Bike.new, false)
    expect(result.working?).to eq false
  end
end
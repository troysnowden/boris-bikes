require 'docking_station'
require 'bike'

describe DockingStation do

  before(:each) do 
    @new_bike = Bike.new
    @docking_station = DockingStation.new
  end

  it 'docking station responds to release_bike method' do
    
    expect(@docking_station).to respond_to(:release_bike)
  end

  it 'docking station releases bike' do
    result = @docking_station.release_bike
    expect(result.is_a? Bike).to eq(true)
    expect(@new_bike.working?).to eq(true)
  end

  it 'docking station should not release a bike if there are none available' do
    @docking_station.release_bike
    @docking_station.release_bike
    @docking_station.release_bike
    expect{@docking_station.release_bike}.to raise_error("There are no bikes to release")
  end
end
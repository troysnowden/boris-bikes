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
    expect(@docking_station.release_bike).to eq(@new_bike)
    expect(@new_bike.working?).to eq(true)
  end

  it 'should allow bikes to be docked in the docking station' do
    expect(@docking_station.dock_bike(@new_bike)).to eq("Your bike has been stored")
  end

  it 'should test attr_reader and return instance of the bike' do
    expect(@docking_station.bike.is_a? Bike).to eq(true)
  end
end
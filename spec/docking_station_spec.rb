require 'docking_station'

describe DockingStation do
  it 'docking station responds to release_bike method' do
    docking_station = DockingStation.new
    expect(docking_station).to respond_to(:release_bike)
  end
end
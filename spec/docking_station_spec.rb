require 'docking_station'
require 'bike'

describe DockingStation do
  
  let(:new_bike) { double :bike }
  subject(:docking_station) {described_class.new(new_bike)}

  it 'docking station responds to release_bike method' do
    expect(docking_station).to respond_to(:release_bike)
  end

  it 'docking station releases bike' do
    allow(new_bike).to receive(:working?).and_return(true)
    allow(new_bike).to receive(:is_a?).and_return(true)
    docking_station.dock_bike(new_bike)
    result = docking_station.release_bike
    expect(result.is_a? Bike).to eq(true)
    expect(result.working?).to eq(true)
  end

  it 'docking station should not release a bike if there are none available' do
    expect{docking_station.release_bike}.to raise_error("There are no bikes to release")
  end

  it 'docking station should not add a bike if it is at capacity' do
    (docking_station.DEFAULT_CAPACITY).times do
      docking_station.dock_bike(new_bike)
    end
    expect{docking_station.dock_bike(new_bike)}.to raise_error("There is no room for this bike")
  end

  it 'should set default capacity as a parameter' do
    docking_station = DockingStation.new(new_bike, 5)
    expect(docking_station.DEFAULT_CAPACITY).to eq(5)
  end

  it 'will update a bike to broken on return' do
    allow(new_bike).to receive(:report_bike).and_return(true)
    result = docking_station.dock_bike(new_bike, false)
    allow(new_bike).to receive(:working?).and_return(false)
    expect(result.working?).to eq false
  end

  it 'should so something' do
    allow(new_bike).to receive(:working?).and_return(true)
    docking_station.dock_bike(new_bike)
    bike = docking_station.release_bike
    expect(bike.working?).to eq(true)
  end

  it 'should release broken bikes to van' do
    allow(new_bike).to receive(:working?).and_return(false)
    allow(new_bike).to receive(:report_bike).and_return(false)
    docking_station.dock_bike(new_bike, false)
    docking_station.dock_bike(new_bike, false)
    docking_station.dock_bike(new_bike, false)
    expect(docking_station.release_broken_bikes_for_van).to eq([new_bike, new_bike, new_bike])
  end

  it 'should receive bikes from van' do
    allow(new_bike).to receive(:working?).and_return(true)
    bikes_from_van = [new_bike, new_bike, new_bike]
    docking_station.receive_bikes_from_van(bikes_from_van)
    3.times do
      docking_station.release_bike
    end
    expect{docking_station.release_bike}.to raise_error("There are no bikes to release")
  end

end
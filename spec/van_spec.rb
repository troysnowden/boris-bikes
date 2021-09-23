require 'van'
require 'bike'
require 'docking_station'

describe Van do
  
  subject(:van) {described_class.new}
  let(:bike) {double :bike}
  let(:docking_station) {double :docking_station}
  
  it 'can deliver broken bikes from docking station to garage' do
    allow(docking_station).to receive(:release_broken_bikes_for_van).and_return([bike, bike, bike])
    allow(bike).to receive(:fix_bike).and_return(true)
    allow(docking_station).to receive(:receive_bikes_from_van).and_return(true)
    expect(van.collect_bikes_from_station(docking_station)).to eq(true)
  end

  it 'can deliver bikes from garage to docking station' do
    allow(docking_station).to receive(:receive_bikes_from_van).and_return(true)
    expect(van.collect_bikes_from_garage([bike, bike, bike], docking_station)).to eq(true)
  end
end
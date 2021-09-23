require 'garage'
require 'bike'

describe Garage do

  subject(:garage) {described_class.new}
  let(:bike) {double :bike}

  it 'should receive a bike and be able to return it fixed' do
    allow(bike).to receive(:working?).and_return(true)
    allow(bike).to receive(:fix_bike).and_return(true)
    expect(garage.fix_bike(bike)).to eq(true)
    expect(bike.working?).to eq(true)
  end
  
end
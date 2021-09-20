require 'bike'

describe Bike do
  it 'Bike instances to respond_to the method `working?' do
    test_bike = Bike.new
    expect(test_bike).to respond_to(:working?)
  end
end
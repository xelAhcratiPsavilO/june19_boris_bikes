require 'docking_station'
require 'bike'

describe DockingStation do

  bike = Bike.new

  describe '#dock(bike)' do
    it 'raises an error if there is already a bike docked' do
      subject.capacity.times { subject.dock(bike) }
      expect{ subject.dock(bike) } .to raise_error 'station at full capacity'
    end
    it 'stores a bike' do
      expect(subject.dock(bike)).to eq [bike]
    end
  end

  describe '#bikes' do
    it 'access an array of objects store under instance variable @bikes' do
      subject.dock(bike)
      expect(subject.bikes).to eq [bike]
    end
  end

  describe '#capacity' do
    it 'access integer under instance variable @capacity' do
      expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end
  end

  describe '#release_bike' do
    it 'raises an error if there are no bikes available' do
      expect{ subject.release_bike } .to raise_error 'no bikes available'
    end
    it 'releases bikes that work' do
      subject.dock(bike)
      expect(subject.release_bike).to be_working
    end
  end

end

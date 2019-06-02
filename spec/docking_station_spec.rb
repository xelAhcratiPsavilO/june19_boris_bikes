require 'docking_station'
require 'bike'

describe DockingStation do

  bike = Bike.new

  describe '#dock(bike)' do
    it 'raises an error if there is already a bike docked' do
      DockingStation::DEFAULT_CAPACITY.times { subject.dock(bike) }
      expect{ subject.dock(bike) } .to raise_error 'station at full capacity'
    end
    it 'stores a bike' do
      expect(subject.dock(bike)).to eq [bike]
    end
  end

  describe '#bike' do
    it 'access an object store under intance variable @bike' do
      subject.dock(bike)
      expect(subject.bikes).to eq [bike]
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

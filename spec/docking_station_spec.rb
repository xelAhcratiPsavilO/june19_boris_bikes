require 'docking_station'

describe DockingStation do

  describe '#dock(bike)' do
    it 'raises an error if there is already a bike docked' do
      bike = double(:bike)
      subject.capacity.times { subject.dock(bike) }
      expect{ subject.dock(bike) } .to raise_error 'station at full capacity'
    end
    it 'stores a bike' do
      bike = double(:bike)
      expect(subject.dock(bike)).to eq [bike]
    end
  end

  describe '#bikes' do
    it 'access an array of objects store under instance variable @bikes' do
      bike = double(:bike)
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
      bike = double(:bike)
      expect{ subject.release_bike } .to raise_error 'no bikes available'
    end
    it 'releases bikes that work' do
      bike = double(:bike, working?: true)
      subject.dock(bike)
      expect(subject.release_bike).to be_working
    end
    it 'raises an error if the bike is not working' do
      bike = double(:bike, working?: false)
      subject.dock(bike)
      expect{ subject.release_bike } .to raise_error 'this bike is broken'
    end
  end

end

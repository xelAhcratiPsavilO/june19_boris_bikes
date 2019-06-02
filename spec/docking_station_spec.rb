require 'docking_station'

describe DockingStation do

  it "releases bikes that work" do
    bike = subject.release_bike
    expect(bike).to be_working
  end

  it "stores a bike" do
    bike = subject.release_bike
    expect(subject.dock(bike)).to eq bike
  end

  it "access an object store under intance variable @bike" do
    bike = subject.release_bike
    subject.dock(bike)
    expect(subject.bike).to eq bike
  end

end

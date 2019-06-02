require 'docking_station'

describe DockingStation do

  it { is_expected.to respond_to :release_bike }

  it "releases bikes that work" do
    bike = subject.release_bike
    expect(bike).to be_working
  end

  it "stores a bike" do
    bike = subject.release_bike
    expect(subject.dock(bike)).to eq bike
  end

end

require 'docking_station'

describe DockingStation do

  it { is_expected.to respond_to :release_bike }

  it "releases bikes that work" do
    bike = subject.release_bike
    expect(bike.working?).to be true
  end

end

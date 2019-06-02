require_relative 'bike'

class DockingStation

  def initialize
    @bikes = []
  end

  attr_reader :bikes

  def release_bike
    fail 'no bikes available' unless @bikes.count > 0
    @bikes.pop
  end

  def dock(bike)
    fail 'station at full capacity' if @bikes.size == 20
    @bikes << bike
  end

end

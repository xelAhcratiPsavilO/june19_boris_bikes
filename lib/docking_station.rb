require_relative 'bike'

class DockingStation

  DEFAULT_CAPACITY = 20

  def initialize
    @bikes = []
  end

  attr_reader :bikes

  def release_bike
    fail 'no bikes available' if empty?
    @bikes.pop
  end

  def dock(bike)
    fail 'station at full capacity' if full?
    @bikes << bike
  end

  private

  def full?
    @bikes.count >= DEFAULT_CAPACITY
  end

  def empty?
    @bikes.empty?
  end

end

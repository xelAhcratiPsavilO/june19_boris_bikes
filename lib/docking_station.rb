class DockingStation

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

    attr_reader :bikes
    attr_reader :capacity

  def release_bike
    fail 'no bikes available' if empty?
    fail 'this bike is broken' if broken?
    @bikes.pop
  end

  def dock(bike)
    fail 'station at full capacity' if full?
    @bikes << bike
  end

  private

  def full?
    @bikes.count >= @capacity
  end

  def empty?
    @bikes.empty?
  end

  def broken?
    @bikes.last.working? == false
  end

end

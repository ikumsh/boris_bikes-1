require_relative 'bike'

class DockingStation
  attr_reader :capacity

  def initialize(capacity = 20)
    @capacity = capacity
    @docked = Docked.new
  end

  def dock_bike(bike)
    raise 'Docking station full' if full?
    @docked.bikes << bike
  end

  def release_bike
    raise 'No bikes available' if empty?
    @docked.bikes.pop
  end

  private

  def full?
    @docked.bikes.count >= @capacity
  end

  def empty?
    @docked.bikes.empty?
  end

end

class Docked
  attr_reader :bikes

  def initialize()
    @bikes = []
  end
end

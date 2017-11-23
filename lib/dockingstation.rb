require_relative 'bike'

class DockingStation
  attr_reader :capacity, :docked_bikes

  def initialize(capacity = 20)
    @capacity = capacity
    @docked_bikes = []
  end

  def dock_bike(bike)
    raise 'Docking station full' if full?
    @docked_bikes << bike
    self
  end

  def release_bike
    raise 'No bikes available' if empty?
    raise 'Bike is broken. Cannot release a broken bike.' if docked_bikes[-1].broken?
    @docked_bikes.pop
  end

  private

  def full?
    @docked_bikes.count >= @capacity
  end

  def empty?
    @docked_bikes.empty?
  end
end

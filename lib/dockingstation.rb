require_relative 'bike'

class DockingStation

  def initialize()
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
    @docked.bikes.count == 20 ? true : false
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

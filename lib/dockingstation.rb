require_relative 'bike'

class DockingStation
  attr_reader :bikes

  def initialize()
    @bikes = []
  end

  def dock_bike(bike)
    @bikes << bike
  end

  def release_bike
    raise "There are no bikes" if @bikes.empty?
    @bikes.pop
  end
end

require_relative 'dockingstation'

class Van

  def collect_broken(docked_bikes)
    broken_bikes = docked_bikes.select{|bike| bike.broken?}
  end

end

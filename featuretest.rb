require './lib/dockingstation.rb'
# bike = Bike.new
# station = DockingStation.new
# station.dock(bike.report_broken)


goodbike = Bike.new
brokenbike = Bike.new.report_broken
#
# #should return true
# p bike.working?
#
# #should change bike condition
# bike.report_broken
#
# #should now return false
# p bike.working?
station = DockingStation.new

p 'docks new bike'
p station.dock_bike(goodbike).docked_bikes

p 'docks broken bike'
p station.dock_bike(brokenbike).docked_bikes

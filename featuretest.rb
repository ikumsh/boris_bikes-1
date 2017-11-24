require './lib/dockingstation.rb'
require './lib/van.rb'
# bike = Bike.new
# station = DockingStation.new
# station.dock(bike.report_broken)


#
# #should return true
# p bike.working?
#
# #should change bike condition
# bike.report_broken
#
# #should now return false
# p bike.working?

bike = Bike.new
brokenbike = Bike.new.report_broken
station = DockingStation.new
van = Van.new

station.dock_bike(brokenbike)
station.dock_bike(bike)

p van.collect_broken_bikes

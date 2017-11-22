require 'dockingstation'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  it 'releases bikes' do
    bike = subject.release_bike
    expect(bike.is_a?(Bike) && bike.working?).to eq true
  end

  it { is_expected.to respond_to(:dock_bike).with(1).argument }

  it 'docks bikes' do
    bike = Bike.new
    expect(subject.dock_bike(bike)).to include bike
  end
end

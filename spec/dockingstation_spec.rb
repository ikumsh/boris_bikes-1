require 'dockingstation'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  describe '#release_bike' do
    it 'returns an error when no bikes available' do
      expect { subject.release_bike }.to raise_error "No bikes available"
    end
    it 'releases bikes' do
      subject.dock_bike(Bike.new)
      bike = subject.release_bike
      expect(bike.is_a?(Bike)).to eq true
    end
  end

  it { is_expected.to respond_to(:dock_bike).with(1).argument }
  describe '#dock_bike' do
    it 'returns an error when docking station is full' do
      20.times {subject.dock_bike(Bike.new)}
      expect {subject.dock_bike(Bike.new)}.to raise_error 'Docking station full'
    end

    it 'docks bikes' do
      bike = Bike.new
      expect(subject.dock_bike(bike)).to include bike
    end
  end
end

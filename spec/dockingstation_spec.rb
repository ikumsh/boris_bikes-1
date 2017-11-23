require 'dockingstation'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }
  it { is_expected.to respond_to(:dock_bike).with(1).argument }

  describe 'initialization' do
    it 'initializes with an initial default capacity of 20' do
      station = DockingStation.new
      expect(station.capacity).to eq 20
    end
    it 'initializes with a variable capacity' do
      station = DockingStation.new(50)
      station.capacity.times {station.dock_bike(Bike.new)}
      expect {station.dock_bike(Bike.new)}.to raise_error 'Docking station full'
    end
  end

  describe '#release_bike' do
    it 'returns an error when no bikes available' do
      expect { subject.release_bike }.to raise_error "No bikes available"
    end
    it 'releases bikes' do
      subject.dock_bike(Bike.new)
      bike = subject.release_bike
      expect(bike.is_a?(Bike)).to eq true
    end
    it 'will not release a broken bike' do
      bike = Bike.new
      station = DockingStation.new
      station.dock_bike(bike.report_broken)
      expect{station.release_bike}.to raise_error 'Bike is broken. Cannot release a broken bike.'
    end

    ### ISOLATE TEST
    let(:bike) {double(:bike)}
    it 'releases working bikes' do
      allow(bike).to receive(:working?).and_return(true)
      allow(bike).to receive(:broken?).and_return(false)
      subject.dock_bike(bike)
      released_bike = subject.release_bike
      expect(released_bike).to be_working
    end
  end

  describe '#dock_bike' do
    it 'returns an error when docking station is full' do
      subject.capacity.times {subject.dock_bike(Bike.new)}
      expect {subject.dock_bike(Bike.new)}.to raise_error 'Docking station full'
    end
    it 'docks bikes' do
      bike = Bike.new
      expect(subject.dock_bike(bike)).to include bike
    end
    it "docks a bike and reports it broken" do
      bike = Bike.new
      station = DockingStation.new
      station.dock_bike(bike.report_broken)
      bike = station.docked_bikes[station.docked_bikes.index(bike)]
      expect(bike.broken?).to eq true
    end
  end
end

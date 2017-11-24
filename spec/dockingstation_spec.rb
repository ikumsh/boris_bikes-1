require 'dockingstation'

describe DockingStation do
  let(:bike) {double(:bike)}

  it { is_expected.to respond_to :release_bike }
  it { is_expected.to respond_to(:dock_bike).with(1).argument }

  describe 'initialization' do
    it 'initializes with an initial default capacity of 20' do
      station = DockingStation.new
      expect(station.capacity).to eq 20
    end

    it 'initializes with a variable capacity' do
      station = DockingStation.new(50)
      station.capacity.times {station.dock_bike(bike)}
      expect {station.dock_bike(bike)}.to raise_error 'Docking station full'
    end
  end

  describe '#release_bike' do
    it 'returns an error when no bikes available' do
      expect { subject.release_bike }.to raise_error "No bikes available"
    end
    it 'releases bikes' do
      bike = double(:bike, broken?: false)
      subject.dock_bike(bike)
      expect(subject.release_bike).to be bike
      #the line below expects an object of the Bike class
      #expect(bike.is_a?(Bike)).to eq true
    end

    it 'will not release a broken bike' do
      station = DockingStation.new
      bike = double(:bike, broken?: true)
      station.dock_bike(bike)
      expect{station.release_bike}.to raise_error 'Bike is broken. Cannot release a broken bike.'
    end

    ### ISOLATE TEST
    it 'releases working bikes' do
      subject.dock_bike(double(:bike, working?: true, broken?: false))
      released_bike = subject.release_bike
      expect(released_bike).to be_working
    end
  end

  describe '#dock_bike' do
    it 'returns an error when docking station is full' do
      subject.capacity.times {subject.dock_bike(bike)}
      expect {subject.dock_bike(bike)}.to raise_error 'Docking station full'
    end
    # it 'docks bikes' do
    #   bike = bike
    #   expect(subject.dock_bike(bike)).to include bike
    # end
    it "docks a bike and reports it broken" do
      station = DockingStation.new
      allow(bike).to receive(:broken?).and_return(true)
      station.dock_bike(bike)
      bike_docked = station.docked_bikes[station.docked_bikes.index(bike)]
      expect(bike_docked.broken?).to eq true
    end
  end
end

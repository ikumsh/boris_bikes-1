require 'van'
#van tests here

describe Van do
  let(:bike) {double(:bike)}

  it { is_expected.to respond_to :collect_broken }

  describe 'collects bikes' do
    it 'collects 1 broken bike' do
      broken_bike = double(:broken_bike, broken?: true)
      bike = double(:broken_bike, broken?: false)
      docked_bikes = []
      docked_bikes << broken_bike
      docked_bikes << bike
      expect(subject.collect_broken(docked_bikes)).to eq [broken_bike]
    end
  end
end

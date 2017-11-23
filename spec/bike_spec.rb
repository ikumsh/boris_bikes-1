require "bike"

describe Bike do
  it { is_expected.to respond_to :working? }
  it { is_expected.to respond_to :broken? }

  it 'can be reported as broken' do
    subject.report_broken
    expect(subject).to be_broken
  end

end

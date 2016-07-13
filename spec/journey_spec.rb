require 'journey'

describe Journey do

  let(:station) {double(:station)}
  subject {described_class.new(station)}

  describe '#station' do
    it 'knows its entry station' do
      expect(subject.station).to eq station
    end
  end


end

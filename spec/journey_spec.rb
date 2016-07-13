require 'journey'

describe Journey do

  let(:entry_station) {double(:entry_station)}
  let(:exit_station) {double(:exit_station)}

  describe '#station' do
    it 'knows its entry station' do
      subject.start_journey(entry_station)
      expect(subject.entry_station).to eq entry_station
    end
  end

  describe '#end_journey'do
    it 'knows its exit station' do
      subject.end_journey(exit_station)
      expect(subject.exit_station).to eq exit_station
    end
  end
end

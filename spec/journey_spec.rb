require 'journey'

describe Journey do
  let(:station) {double(:station)}
  subject(:journey){described_class.new(entry_station: :station)}
  # let(:entry_station) {double(:entry_station)}
  # let(:exit_station) {double(:exit_station)}

  it 'is created with an entry station' do
    expect(journey.entry_station).to eq :station
  end

  it "knows if a journey is in progress" do
    expect(journey).to be_in_progress
  end

  describe '#end_journey'do
    it 'knows its exit station' do
      subject.end_journey(:station)
      expect(subject.exit_station).to eq :station
    end
  end

  describe '#fare' do
    it "states the journey's fare" do
      subject.end_journey(:station)
      expect(subject.fare).to eq(Journey::MINIMUM_BALANCE)
    end
    it "states penalty fare if there is no recorded entry station" do
      subject{described_class.new}
      expect(subject.fare).to eq(Journey::PENALTY_FARE) 
    end
     it "states penalty fare if there is no recorded exit station" do
      expect(subject.fare).to eq(Journey::PENALTY_FARE) 
    end
  end
end

require 'journey'

describe Journey do
	let(:station) {double :station}
	subject {described_class.new(station)}
	
  it 'should know its entry station' do
    expect(subject.entry_station).to eq station
  end

  it 'should know its exit station' do
    subject.exit_station = station
    expect(subject.exit_station).to eq station
  end

  it 'should know that it is active' do
  	expect(subject).to be_active
  end
  it 'should know that it is inactive' do
  	subject.exit_station = station
  	expect(subject).not_to be_active
  end

end

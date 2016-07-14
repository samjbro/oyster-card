require 'journey'

describe Journey do
  it 'should know its entry station' do
    subject.entry_station("st Pancras")
    expect(subject.entry_station).to eq "st Pancras"
  end


end

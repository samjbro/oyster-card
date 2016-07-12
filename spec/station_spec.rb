require 'station'

describe Station do
  let(:station) { Station.new(:new_station, :new_fare) }

  it 'should initialize with a station' do
    expect(station.name).to eq :new_station
  end
  it 'should initialize with a fare zone' do
    expect(station.fare_zone).to eq :new_fare
  end
end

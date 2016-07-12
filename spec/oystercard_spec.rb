require 'oystercard'
describe Oystercard do

  subject { Oystercard.new }
  let(:entry_station) { double :station }
  let(:exit_station) { double :station }

  it 'should have balance' do
    expect(subject).to receive(:balance)
    subject.balance
  end

  context '#top_up' do

    it 'should be able to top up balance' do
      expect{ subject.top_up(10) }.to change{ subject.balance }.by(+10)
    end

    it 'should raise error if top up would exceed max balance' do
    	maximum_balance = Oystercard::MAXIMUM_BALANCE
    	subject.top_up(maximum_balance)
    	error = "Top up would exceed max balance of #{maximum_balance}"
    	expect{subject.top_up(1)}.to raise_error(error)
    end
  end

  context '#touch_in' do
  	it "can touch in" do
     	subject.top_up(1)
  		subject.touch_in(entry_station)
  		expect(subject.entry_station).to eq entry_station
  	end
    it 'raise an error when insufficient balance' do
      error = 'Not enough balance!'
      expect { subject.touch_in(entry_station) }.to raise_error error
    end
  end

  context '#touch_out' do
  	it "can touch_out" do
     	subject.top_up(1)
  		subject.touch_in(entry_station)
  		subject.touch_out(exit_station)
  		expect(subject.entry_station).to eq nil
  	end
  	it "deducts fare at touch out" do
  		subject.top_up(10)
  		subject.touch_in(entry_station)
  		expect{ subject.touch_out(exit_station) }.to change{ subject.balance }.by(-1)
  	end
  	it "stores exit station" do
  		subject.top_up(1)
  		subject.touch_in(entry_station)
  		subject.touch_out(exit_station)
  		expect(subject.exit_station).to eq exit_station
  	end
  	it "records this journey in history" do
  		subject.top_up(10)
  		subject.touch_in(entry_station)
  		subject.touch_out(exit_station)
  		journey = {entry: entry_station, exit: exit_station}
  		expect(subject.journey_history).to include journey
		end
  end

  it {is_expected.to respond_to(:journey_history)}

end

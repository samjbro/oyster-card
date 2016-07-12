require 'oystercard'
describe Oystercard do

  subject { Oystercard.new }

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

  context '#deduct' do
    it { is_expected.to respond_to(:deduct).with(1).arguments}

    it 'should deduct money from balance' do
      expect{ subject.deduct(10) }.to change{ subject.balance }.by(-10)
    end
  end
  context '#in_journey?' do
  	it 'is initially not in a journey' do
  		expect(subject).to_not be_in_journey
  	end
  end

  context '#touch_in' do
  	it "can touch in" do
      subject.top_up(1)
  		subject.touch_in
  		expect(subject).to be_in_journey
  	end
    it 'raise an error when insufficient balance' do
      error = 'Not enough balance!'
      expect { subject.touch_in }.to raise_error error
    end
  end

  context '#touch_out' do
  	it "can touch_out" do
      subject.top_up(1)
  		subject.touch_in
  		subject.touch_out
  		expect(subject).to_not be_in_journey
  	end
  end
end

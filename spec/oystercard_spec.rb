require 'oystercard'

describe Oystercard do
  it 'new oystercard has a balance of 0' do
    expect(subject.balance).to eq 0
  end

  it "should increase the balance by top up amount" do
    expect{subject.top_up(10)}.to change{subject.balance}.by(+10)
  end

  it "should deduct the balance by deduction amount" do
    expect{subject.deduct(10)}.to change{subject.balance}.by(-10)
  end

  it 'should throw an excption if balance exceeds 90' do
    maximum = Oystercard::MAX_BALANCE
    expect{ subject.top_up(maximum+1) }.to raise_error 'Maximum amount exceeded'
  end

  it "should know if status is in_journey" do
    expect(subject).to respond_to(:in_journey?)
    expect(subject.in_journey?).to eq false
  end

  it "should allow a user to touch_in" do
    subject.touch_in
    expect(subject).to be_in_journey
  end

  it "should allow a user to touch_out" do
    subject.touch_in
    subject.touch_out
    expect(subject).to_not be_in_journey
  end
end

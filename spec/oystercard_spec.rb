require 'oystercard'

max_balance = Oystercard::MAX_BALANCE
min_balance = Oystercard::MIN_BALANCE

describe Oystercard do
  it 'new oystercard has a balance of 0' do
    expect(subject.balance).to eq 0
  end

  it "should increase the balance by top up amount" do
    expect{subject.top_up(max_balance)}.to change{subject.balance}.by(max_balance)
  end

  it "should deduct the balance by deduction amount" do
    expect{subject.deduct(max_balance)}.to change{subject.balance}.by(-max_balance)
  end

  it 'should throw an excption if balance exceeds 90' do
    expect{ subject.top_up(max_balance+max_balance) }.to raise_error 'Maximum amount exceeded'
  end

  it "should know if status is in_journey" do
    expect(subject).to respond_to(:in_journey?)
    expect(subject.in_journey?).to eq false
  end

  it "should allow a user to touch_in" do
    subject.top_up(min_balance)
    subject.touch_in
    expect(subject).to be_in_journey
  end

  it "should allow a user to touch_out" do
    subject.top_up(min_balance)
    subject.touch_in
    subject.touch_out
    expect(subject).to_not be_in_journey
  end

  it "should prevent travelling when balance is below £1" do
    expect{ subject.touch_in }.to raise_error "you need at least £1 to travel"
  end
end

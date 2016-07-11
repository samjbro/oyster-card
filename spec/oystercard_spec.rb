require 'oystercard'
describe Oystercard do

  subject { Oystercard.new }

  it 'should have balance' do
    expect(subject).to receive(:balance)
    subject.balance
  end
end

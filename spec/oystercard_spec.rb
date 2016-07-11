#unitialized constant Oystercard (NameError)
require 'oystercard'

describe Oystercard do

  context 'balance' do
    it 'should initialize with 0' do
      expect(subject.balance).to eq 0
    end
    it 'should update the balance with top_up' do
      expect{ subject.top_up(10) }.to change{ subject.balance }.by 10
    end
    it 'raises an error if balance limit is over' do
      top_up_limit = Oystercard::TOP_UP_LIMIT
      subject.top_up(top_up_limit)
      expect{ subject.top_up(1) }.to raise_error "Top up limit of #{top_up_limit} exceeded"
    end
  end

end

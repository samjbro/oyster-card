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
  end

end

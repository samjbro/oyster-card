require 'oystercard'

describe Oystercard  do
	it 'has a default initial balance of 0' do
		expect(subject.balance).to eq 0
	end
	describe '#top_up' do
		it { is_expected.to respond_to(:top_up).with(1).argument }
		it 'can top up the balance' do
			subject.top_up 10
			expect(subject.balance).to eq 10
		end
	end
end
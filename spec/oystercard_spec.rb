require 'oystercard'

describe Oystercard  do
	it 'has a default initial balance of 0' do
		expect(subject.balance).to eq 0
	end
end
require 'oystercard'

describe Oystercard do
  it 'new oystercard has a balance of 0' do
    expect(subject.balance).to eq 0
  end

end

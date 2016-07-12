class Oystercard
  attr_accessor :balance, :entry_station
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1

  def initialize
    @balance = 0
    @entry_station = nil
  end

  def in_journey?
    !!entry_station
  end

  def top_up(amount)
  	fail "Top up would exceed max balance of #{MAXIMUM_BALANCE}" if maximum_balance_reached?(amount)
    self.balance += amount
  end

  def touch_in(station)
    fail 'Not enough balance!' if insufficient_balance?
    self.entry_station = station
  end

  def touch_out
  	deduct(1)
    self.entry_station = nil
  end

private

def deduct(amount)
  self.balance -= amount
end

def insufficient_balance?
  balance < MINIMUM_BALANCE
end

def maximum_balance_reached? amount
	(amount + balance) > MAXIMUM_BALANCE
end

end

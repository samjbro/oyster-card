class Oystercard
  attr_accessor :balance, :entry_station, :exit_station, :journey_history
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1

  def initialize
    @balance = 0
    @entry_station = nil
    @exit_station = nil
    @journey_history = []
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

  def touch_out(station)
  	deduct(1)
  	self.exit_station = station
  	self.journey_history << {entry: self.entry_station, exit: self.exit_station}
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

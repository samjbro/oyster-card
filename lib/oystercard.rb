class Oystercard
  attr_accessor :balance
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
  	fail "Top up would exceed max balance of #{MAXIMUM_BALANCE}" if amount + balance > MAXIMUM_BALANCE
    self.balance += amount
  end

  def deduct(amount)
    self.balance -= amount
  end

  def in_journey?
  	@in_journey
  end

  def touch_in
    fail 'Not enough balance!' if insufficient_balance?
  	@in_journey = true
  end

  def touch_out
  	@in_journey = false
  end

private

def insufficient_balance?
  balance < MINIMUM_BALANCE
end

end

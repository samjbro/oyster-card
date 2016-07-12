class Oystercard
  attr_accessor :balance
  MAXIMUM_BALANCE = 90

  def initialize
    @balance = 0
  end
  def top_up(amount)
  	fail "Top up would exceed max balance of #{MAXIMUM_BALANCE}" if amount + balance > MAXIMUM_BALANCE
    self.balance += amount
  end
  def deduct(amount)
    self.balance -= amount
  end
end

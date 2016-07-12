class Oystercard

TOP_UP_LIMIT = 90

attr_accessor :balance
attr_accessor :in_journey

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    raise "Top up limit of #{TOP_UP_LIMIT} exceeded" if amount + balance > TOP_UP_LIMIT
    self.balance += amount
  end

  def deduct(amount)
    self.balance -= amount
  end

  def in_journey?
    in_journey
  end

  def touch_in!
    self.in_journey = true
  end

  def touch_out!
    self.in_journey = false
  end

end

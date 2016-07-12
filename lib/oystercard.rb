class Oystercard

TOP_UP_LIMIT = 90
MINIMUM_BALANCE = 1

attr_accessor :balance
attr_accessor :in_journey
attr_reader :entry_station

  def initialize
    @balance = 0
    @entry_station = nil
  end

  def top_up(amount)
    raise "Top up limit of #{TOP_UP_LIMIT} exceeded" if amount + balance > TOP_UP_LIMIT
    self.balance += amount
  end

  def in_journey?
    @entry_station.nil? ? false : true
  end

  def touch_in!(station)
    raise 'Balance too low, please top up your card' if balance < MINIMUM_BALANCE
    @entry_station = station
    self.in_journey = true
  end

  def touch_out!
    deduct(MINIMUM_BALANCE)
    self.in_journey = false
    @entry_station = nil
  end

private

  def deduct(amount)
    self.balance -= amount
  end

end

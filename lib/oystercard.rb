class Oystercard

TOP_UP_LIMIT = 90
MINIMUM_BALANCE = 1

attr_accessor :balance
attr_reader :entry_station
attr_reader :exit_station
attr_reader :journeys

  def initialize
    @balance = 0
    @entry_station = nil
    @exit_station = nil
    @journeys = []
  end

  def top_up(amount)
    raise "Top up limit of #{TOP_UP_LIMIT} exceeded" if amount + balance > TOP_UP_LIMIT
    self.balance += amount
  end

  def in_journey?
    !!@entry_station
  end

  def touch_in!(station)
    raise 'Balance too low, please top up your card' if balance < MINIMUM_BALANCE
    @entry_station = station
  end

  def touch_out!(station)
    deduct(MINIMUM_BALANCE)
    @exit_station = station
    store_journey
    @exit_station, @entry_station = nil
  end

private

  def store_journey
    journey = Hash[:entry_station => @entry_station, :exit_station => @exit_station]
    @journeys << journey
  end

  def deduct(amount)
    self.balance -= amount
  end

end

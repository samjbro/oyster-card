require_relative 'station'
class Oystercard

TOP_UP_LIMIT = 90
MINIMUM_BALANCE = 1

attr_accessor :balance
attr_reader :entry_station, :exit_station, :journeys

  def initialize
    reset_station
    @balance = 0
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
    reset_station
  end

private

  def store_journey
    journey = Hash[:entry_station => @entry_station, :exit_station => @exit_station]
    @journeys << journey
  end

  def reset_station
    @exit_station, @entry_station = nil
  end

  def deduct(amount)
    self.balance -= amount
  end

end

require_relative 'journey'
require_relative 'station'
class Oystercard

TOP_UP_LIMIT = 90
MINIMUM_BALANCE = 1

attr_accessor :balance
attr_reader :journey_history

  def initialize
    # reset_station
    @balance = 0
    @journey_history = []
    @journey = nil
  end

  def top_up(amount)
    raise "Top up limit of #{TOP_UP_LIMIT} exceeded" if amount + balance > TOP_UP_LIMIT
    self.balance += amount
  end

  def in_journey?
    !!@journey
  end

  def touch_in!(station)
    raise 'Balance too low, please top up your card' if balance < MINIMUM_BALANCE
    @journey = Journey.new
    @journey.start_journey(station)
  end

  def touch_out!(station)
    deduct(MINIMUM_BALANCE)
    @journey.end_journey(station)
    store_journey
    @journey = nil
  end

private

  def store_journey
    puts @journey
    @journey_history << @journey
  end

  # def reset_station
  #   @exit_station, @entry_station = nil
  # end

  def deduct(amount)
    self.balance -= amount
  end

end

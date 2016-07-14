class Oystercard

  MAX_BALANCE = 90
  MIN_BALANCE = 1
  MIN_CHARGE = 1

  attr_reader :entry_station, :balance, :journey_history

  def initialize
    @balance = 0
    @entry_station = nil
    @journey_history = []
  end

  def top_up(amount)
    raise 'Maximum amount exceeded' if (balance + amount) > MAX_BALANCE
    @balance += amount
  end

  def in_journey?
    !!entry_station
  end

  def touch_in(station)
    fail "you need at least £1 to travel" if balance < MIN_BALANCE
    @entry_station = station

  end

  def touch_out(station)
    deduct(MIN_CHARGE)
    @journey_history << { "entry" => @entry_station, "exit" => station }
    @entry_station = nil
  end

  private

  def deduct(amount)
    @balance -= amount
  end
end

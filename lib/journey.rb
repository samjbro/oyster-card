require_relative 'station'

class Journey

MINIMUM_BALANCE = 1
PENALTY_FARE = 6

attr_accessor :entry_station, :exit_station

  def  initialize
    @entry_station = nil
    @exit_station = nil
  end

  def start_journey(station)
    self.entry_station = station
  end

  def end_journey(station)
    self.exit_station = station
  end

  def in_progress?
    !!@entry_station
  end

  def fare
    ((entry_station == nil) || (exit_station == nil)) ? PENALTY_FARE : MINIMUM_BALANCE
  end
end

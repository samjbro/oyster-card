require_relative 'station'

class Journey

MINIMUM_BALANCE = 1
PENALTY_FARE = 6

attr_accessor :entry_station, :exit_station

  def  initialize(entry_station: nil)
    @entry_station = entry_station
    @exit_station = nil
    @fare = PENALTY_FARE
  end

  def end_journey(station)
    self.exit_station = station
  end

  def in_progress?
    !!@entry_station
  end

  def fare
    @fare = MINIMUM_BALANCE if (entry_station && exit_station)
    @fare
  end
end

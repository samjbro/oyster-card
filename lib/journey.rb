require_relative 'station'

class Journey

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
end

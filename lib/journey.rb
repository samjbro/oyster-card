require_relative 'station'

class Journey

attr_reader :station

  def  initialize(station)
    @station = station
  end

  def exit
  end

  def in_journey?
    !!@entry_station
  end
end

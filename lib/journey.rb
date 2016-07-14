class Journey
	attr_accessor :entry_station
	attr_accessor :exit_station

def initialize station
  @entry_station = station
end

def active?
  true if @entry_station && @exit_station.nil?
end

end

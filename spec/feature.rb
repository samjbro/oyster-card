require './lib/oystercard.rb'
require './lib/station.rb'
# card = Oystercard.new
# card.top_up(10)
# card.touch_in("Kings Cross")
# card.touch_out("st Pancras")
# puts card.journeys

station = Station.new("Bank", 1)
p station.name
p station.zone
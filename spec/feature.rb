require '../lib/oystercard.rb'
card = Oystercard.new
card.top_up(10)
card.touch_in("Kings Cross")
card.touch_out("st Pancras")
puts card.journeys

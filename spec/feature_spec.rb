require_relative '../lib/oystercard.rb'

card = Oystercard.new
station1 = "Kingston"
station2 = "Bank"
p card.journey_history
card.top_up(10)
card.touch_in(station1)
card.touch_out(station2)
p card.journey_history
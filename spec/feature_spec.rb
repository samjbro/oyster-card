require_relative '../lib/oystercard.rb'

card = Oystercard.new
card.in_journey?
card.touch_in
card.in_journey?
p card.touch_out

require_relative '../lib/oystercard.rb'

card = Oystercard.new
card.top_up 10
card.touch_in
card.touch_out
p card.balance
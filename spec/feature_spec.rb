require_relative '../lib/oystercard.rb'

card = Oystercard.new
card.top_up(90)
# card.top_up(1)
p card.balance
require './lib/oystercard'

enter_station = Station.new(name: "Charring Cross", zone: 1)
exit_station = Station.new(name: "Banana Hill", zone: 5)

card = Oystercard.new
card.top_up(15)
card.touch_in!(enter_station)
card.touch_out!(exit_station)
puts "Balance after touching in and out should be: 14 \n it is: #{card.balance}"

card.touch_in!(enter_station)
card.touch_in!(enter_station)
puts "Balance after touching in twice should be: 8 \n it is: #{card.balance}"

card.touch_out!(exit_station)
card.touch_out!(exit_station)
puts "Balance after touching out twice should be: 1 \n it is: #{card.balance}"
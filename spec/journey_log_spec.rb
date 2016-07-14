require 'journey_log'

describe JourneyLog do
	let(:entry_station) { double :entry_station }
	context "#start" do
		it "creates a new Journey" do
			expect(subject.start(entry_station)).to be_a Journey
		end
	end
end

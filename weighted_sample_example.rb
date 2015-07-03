# http://stackoverflow.com/questions/4463561/weighted-random-selection-from-array

class Thing
  attr_reader :weight
  def initialize(weight)
    @weight = weight
  end
end

def custom_sample(things)
  tickets = []

  things.each do |t|
    t.weight.times { tickets << t }
  end

  tickets.sample
end

things = []

things << Thing.new(3)
things << Thing.new(6)
things << Thing.new(1)

winner = custom_sample(things)
puts "Thing with weight #{winner.weight} won!"

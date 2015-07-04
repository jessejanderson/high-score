class Game
  attr_accessor :fights, :fights_won
  attr_reader :name
  def initialize(name)
    @name       = name
    @fights     = 0
    @fights_won = 0
  end

  def to_s
    "#{name}"
  end

  def winPercentage
    fights_won.to_f / fights.to_f
  end
end

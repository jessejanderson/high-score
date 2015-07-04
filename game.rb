class Game
  attr_accessor :fights
  attr_reader :name
  def initialize(name)
    @name = name
    @fights = 0
  end
  def to_s
    "#{name} [#{fights}]"
  end
end

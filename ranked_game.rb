# wins / fights = confidence?
# nope, 1 / fights = how much needed to retest
# should also account for (least recently checked)
#
# loserIndex = everything past this index has never won a fight
# or maybe it should be held in a separate array?

# TO-DO
#
# [ ] Create algorithm for "random" games
#     More likely: less fights, popular games, current & not recently fought
# [ ] Create a fights.count threshfold for "probably done ranking"
# [ ] Allow that threshold to be disturbed if a high ranking game gets surpassed
# [ ] sync with external game database
#


require 'io/console'
require_relative 'compare_games'


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

# This should be it's own method for different files
if File.exists?('saved_file.txt')
  File.open('saved_file.txt') do |f|
    saved_file = Marshal.load(f){:all_games}
    @all_games = saved_file[:all_games]
    @high_score_list = saved_file[:high_score_list]
    @losersIndex = saved_file[:losers_index]
  end
else
  @all_games = [Game.new("Assassin's Creed IV: Black Flag"), Game.new("Battlefield 4"), Game.new("Call of Duty: Advanced Warfare"), Game.new("Call of Duty: Ghosts"), Game.new("Child of Light"), Game.new("Crimson Dragon"), Game.new("Dead Rising 3"), Game.new("Destiny"), Game.new("Destiny: Expansion I - The Dark Below"), Game.new("Destiny: Expansion II - House of Wolves"), Game.new("Diablo III: Reaper of Souls"), Game.new("Dragon Age: Inquisition"), Game.new("Dying Light"), Game.new("Far Cry 4"), Game.new("Forza Motorsport 5"), Game.new("Guacamelee!: Super Turbo Championship Edition"), Game.new("Halo: The Master Chief Collection"), Game.new("Madden NFL 25"), Game.new("Max: The Curse of Brotherhood"), Game.new("Middle-earth: Shadow of Mordor"), Game.new("Need for Speed: Rivals"), Game.new("Ryse: Son of Rome"), Game.new("Sniper Elite III"), Game.new("Titanfall"), Game.new("Trials Fusion"), Game.new("Watch_Dogs"), Game.new("Wolfenstein: The New Order"), Game.new("Xbox Fitness"), Game.new("Zoo Tycoon")]
  @high_score_list = []
  @loserIndex = 0
end


puts "Ranking from #{@all_games.count} games."

def getRandomGames(amount, source)
  source.sample(amount)
end


def rankLoop
  compareGames(@all_games, @high_score_list)
  puts ""
  puts "-----"
  puts ""
  puts "Would you like to make another comparison? [y/n]"
  answer = gets.chomp
  puts "You answered #{answer}"
  if answer === "y"
    rankLoop
  else
    puts "Thanks for playing."
    return
  end
end

compareGames(@all_games, @high_score_list)

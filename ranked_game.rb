# Need to add times_ranked so that anomalies that rank high early will get pushed back quicker
# Currently, games that rank high earlier can only fall one spot at a time
# http://stackoverflow.com/questions/1855800/1-vs-1-vote-calculate-ratings-flickchart-com
#
# wins / fights = confidence?
# nope, 1 / fights = how much needed to retest
# should also account for (least recently checked)
#
# loserIndex = everything past this index has never won a fight
# or maybe it should be held in a separate array?



require 'io/console'
require_relative 'compare_games'


class Game
  attr_accessor :fights
  attr_reader :name
  def initialize(name)
    @name = name
    @fights = 1
  end
  def to_s
    name
  end
end

@all_games = [Game.new("Assassin's Creed IV: Black Flag"), Game.new("Battlefield 4"), Game.new("Call of Duty: Advanced Warfare"), Game.new("Call of Duty: Ghosts"), Game.new("Child of Light"), Game.new("Crimson Dragon"), Game.new("Dead Rising 3"), Game.new("Destiny"), Game.new("Destiny: Expansion I - The Dark Below"), Game.new("Destiny: Expansion II - House of Wolves"), Game.new("Diablo III: Reaper of Souls"), Game.new("Dragon Age: Inquisition"), Game.new("Dying Light"), Game.new("Far Cry 4"), Game.new("Forza Motorsport 5"), Game.new("Guacamelee!: Super Turbo Championship Edition"), Game.new("Halo: The Master Chief Collection"), Game.new("Madden NFL 25"), Game.new("Max: The Curse of Brotherhood"), Game.new("Middle-earth: Shadow of Mordor"), Game.new("Need for Speed: Rivals"), Game.new("Ryse: Son of Rome"), Game.new("Sniper Elite III"), Game.new("Titanfall"), Game.new("Trials Fusion"), Game.new("Watch_Dogs"), Game.new("Wolfenstein: The New Order"), Game.new("Xbox Fitness"), Game.new("Zoo Tycoon")]
# @all_games = [Game.new("Uncharted 1"), Game.new("Uncharted 2"), Game.new("Uncharted 3"), Game.new("Uncharted 4"), Game.new("Uncharted 5"), Game.new("Uncharted 6")]

if File.exists?('high_score_list.txt')
  File.open('high_score_list.txt') do |f|
    @high_score_list = Marshal.load(f)
  end
else
  @high_score_list = []
end

if File.exists?('losers_index.txt')
  File.open('losers_index.txt') do |f|
    @losersIndex = Marshal.load(f)
  end
else
  @losersIndex = 0
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

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
require "yaml"
require_relative 'file_management'
require_relative 'compare_games'
require_relative 'game'


def getRandomGames(amount, source)
  source.sample(amount)
end

# Load data from the saved file OR grab default data
applyDataFromFile(openDefault)

puts "losersIndex is #{@losersIndex}"

puts "Ranking from #{@all_games.count} games."

# Start the comparing game
compareGames(@all_games, @high_score_list)

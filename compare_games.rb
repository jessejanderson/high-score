require_relative 'rank_two_items'

def compareGames(source_list, ranked_list)
  puts ""
  puts "========================================"
  puts "  HIGH SCORE"
  puts "========================================"
  ranked_list.each_with_index {|game, index| puts "  #{index+1}. #{game}"}
  puts "========================================"
  puts ""

  games_to_compare = getRandomGames(2, source_list)

  firstGame = games_to_compare[0]
  firstGameIndex = ranked_list.index(firstGame)

  secondGame = games_to_compare[1]
  secondGameIndex = ranked_list.index(secondGame)

  def addFightCount
    firstGame.fights = firstGame.fights + 1
    secondGame.fights = secondGame.fights + 1
  end

  if firstGameIndex and secondGameIndex
    if firstGameIndex < secondGameIndex
      winnerIndex = firstGameIndex
    else
      winnerIndex = secondGameIndex
    end
  elsif firstGameIndex
    winnerIndex = firstGameIndex
  elsif secondGameIndex
    winnerIndex = secondGameIndex
  else
    winnerIndex = ranked_list.count
  end

  puts ""

  # puts "[q = never played 1, w = never played 2, e = never played either]"
  puts "[x to exit]"
  puts "[Vote for 1 or 2]"
  puts ""
  puts "Which game is better?"
  puts "1. #{firstGame.name}"
  puts "2. #{secondGame.name}"
  answer = STDIN.getch

  if answer == ?x
    saved_file = {all_games: @all_games, high_score_list: @high_score_list, loser_index: @losersIndex}
    File.open('saved_file.txt', 'w+') do |f|
      Marshal.dump(saved_file, f)
    end
    puts "Thanks for playing!"
    return
  elsif answer == ?1
    rankTwoItems(firstGame, secondGame, ranked_list)
  elsif answer == ?2
    rankTwoItems(secondGame, firstGame, ranked_list)
  end
  # elsif answer == ?q
  #   source_list.delete_at(source_list.index(firstGame))
  # elsif answer == ?w
  #   source_list.delete_at(source_list.index(secondGame))
  # elsif answer == ?e
  #   source_list.delete_at(source_list.index(firstGame))
  #   source_list.delete_at(source_list.index(secondGame))
  # elsif answer == ?1
  #   addFightCount
  #   if !firstGameIndex
  #     ranked_list.insert(winnerIndex,firstGame)
  #   else
  #     ranked_list.insert(winnerIndex, ranked_list.delete_at(firstGameIndex))
  #   end
  #   if !secondGameIndex
  #     ranked_list.push secondGame
  #   end
  # else
  #   addFightCount
  #   if !secondGameIndex
  #     ranked_list.insert(winnerIndex,secondGame)
  #   else
  #     ranked_list.insert(winnerIndex, ranked_list.delete_at(secondGameIndex))
  #   end
  #   if !firstGameIndex
  #     ranked_list.push firstGame
  #   end
  # end

  compareGames(source_list, ranked_list)
end

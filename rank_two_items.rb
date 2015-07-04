def rankTwoItems(winner, loser, ranked_list)
  # adjusts winner/loser in ranked_list
  # increases winner/loser fight count
  # increases @losersIndex (when applicable)

  winnerRank  = ranked_list.index(winner)
  puts "winnerRank is #{winnerRank}"
  loserRank   = ranked_list.index(loser)
  puts "loserRank is #{loserRank}"

  loser.fights += 1
  winner.fights += 1
  winner.fights_won += 1

  if winnerRank != nil and loserRank != nil
    if winnerRank > loserRank
      if loserRank > @losersIndex
        ranked_list.insert(@losersIndex, ranked_list.delete_at(winnerRank))
      else
        ranked_list.insert(loserRank, ranked_list.delete_at(winnerRank))
      end
      @losersIndex += 1 # moves back since winner moved above it
    end
  elsif winnerRank != nil # and loser is not ranked
    ranked_list.push(loser)
  elsif loserRank != nil # and winner is not ranked
    if loserRank > @losersIndex
      ranked_list.insert(@losersIndex, winner)
    else
      ranked_list.insert(loserRank, winner)
    end
    @losersIndex += 1 # moves back since winner moved above it
  else # neither are ranked
    ranked_list.insert(@losersIndex, winner)
    ranked_list.push(loser)
    @losersIndex += 1 # moves back since winner moved above it
  end

end

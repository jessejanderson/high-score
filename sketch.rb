Arrays
======
@all_games          = has all the game objects, imported from igdb
@ranked_list        = has all the ranked items, tied to all_games info

Methods
=======
:findRandomObjects  = takes an amount (2) and a source (@all_games)
                      finds those from the all_games list
                      somehow need to weight these
:fights             = execs :findRandomObject(2, @all_games)
                      shows them to user with instructions
                      adds winner/loser to ranked_list if not there
                      or adjusts winner/loser index in ranked_list

findRandomObjects - Algorithm Factors
=====================================
:Popularity
:fights.count

def rankTwoItems(winner, loser, ranked_list)
  # adjusts winner/loser in ranked_list
  # increases winner/loser fight count
  # increases @loserIndex (when applicable)

  winnerRank  = ranked_list.index(winner)
  loserRank   = ranked_list.index(loser)
  winner.fights += 1
  loser.fights += 1

  if winnerRank.present? and loserRank.present?
    if winner.index > loser.index
      ranked_list.insert(loser.index, ranked_list.delete_at(winner.index))
      @loserIndex += 1 # moves back since winner moved above it
    end
  elsif winnerRank.present? # and loser is not ranked
    ranked_list.push(loser)
  elsif loserRank.present? # and winner is not ranked
    ranked_list.insert(loser.index, winner)
    @loserIndex += 1 # moves back since winner moved above it
  else # neither are ranked
    ranked_list.insert(@loserIndex, winner)
    ranked_list.push(loser)
    @loserIndex += 1 # moves back since winner moved above it
  end

end



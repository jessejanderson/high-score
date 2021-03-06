def open(filename)
  if File.exists?(filename)
    YAML.load_file(filename)
  end
end

def save(filename, saved_data)
  File.open(filename, "w") do |file|
    file.write(saved_data.to_yaml)
  end
end

def openDefault
  open('highscore.yml')
end

def saveDefault
  highscore_data = {all_games: @all_games, high_score_list: @high_score_list, losers_index: @losersIndex}
  save('highscore.yml', highscore_data)
end

def applyDataFromFile(file)
  if file != nil
    @all_games = file[:all_games]
    @high_score_list = file[:high_score_list]
    @losersIndex = file[:losers_index]
  else
    applyDefaultData
  end
end

def applyDefaultData
  @all_games = [Game.new("Assassin's Creed IV: Black Flag"), Game.new("Battlefield 4"), Game.new("Call of Duty: Advanced Warfare"), Game.new("Call of Duty: Ghosts"), Game.new("Child of Light"), Game.new("Crimson Dragon"), Game.new("Dead Rising 3"), Game.new("Destiny"), Game.new("Destiny: Expansion I - The Dark Below"), Game.new("Destiny: Expansion II - House of Wolves"), Game.new("Diablo III: Reaper of Souls"), Game.new("Dragon Age: Inquisition"), Game.new("Dying Light"), Game.new("Far Cry 4"), Game.new("Forza Motorsport 5"), Game.new("Guacamelee!: Super Turbo Championship Edition"), Game.new("Halo: The Master Chief Collection"), Game.new("Madden NFL 25"), Game.new("Max: The Curse of Brotherhood"), Game.new("Middle-earth: Shadow of Mordor"), Game.new("Need for Speed: Rivals"), Game.new("Ryse: Son of Rome"), Game.new("Sniper Elite III"), Game.new("Titanfall"), Game.new("Trials Fusion"), Game.new("Watch_Dogs"), Game.new("Wolfenstein: The New Order"), Game.new("Xbox Fitness"), Game.new("Zoo Tycoon")]
  @high_score_list = []
  @losersIndex = 0
end

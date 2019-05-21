def game_hash
  game_hash = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        "Alan Anderson" => {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        "Reggie Evans" => {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        "Brook Lopez" => {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        "Mason Plumlee" => {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        "Jason Terry" => {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      }
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {
        "Jeff Adrien" => {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        "Bismack Biyombo" => {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },
        "DeSagna Diop" => {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        "Ben Gordon" => {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        "Brendan Haywood" => {
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        },
      }
    }
  }
end

def num_points_scored(player)
  game_hash.each do |base, info|
    info[:players].each do |pname, details|
      if player == pname
        return details[:points]
      end
    end
  end
end

def shoe_size(player)
  game_hash.each do |base, info|
    info[:players].each do |pname, details|
      if player == pname
        return details[:shoe]
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |base, info|
    if info[:team_name] == team_name
      return info[:colors]
    end
  end
end

def team_names
  teams = []
  game_hash.each do |base, info|
    teams.push(info[:team_name])
  end
  teams
end

def player_numbers(team_name)
  jerseys = []
  game_hash.each do |base, info|
    if info[:team_name] == team_name
      info[:players].each do |pname, details|
        jerseys.push(details[:number])
      end
    end
  end
  jerseys
end

def player_stats(player)
  game_hash.each do |base, info|
    info[:players].each do |pname, details|
      if player == pname
        return details
      end
    end
  end
end

def big_shoe_rebounds
  rebounds = []
  game_hash.each do |base, info|
    shoe_sizes = []
    info[:players].each do |pname, details|
      shoe_sizes.push(details[:shoe])
    end
    shoe_sizes.sort!
    largest_size = shoe_sizes[-1]
    info[:players].each do |pname, details|
      if details[:shoe] == largest_size
        rebounds.push(details[:rebounds])
      end
    end
  end
  rebounds[0]
end

def most_points_scored
  top_scorer = ""
  game_hash.each do |base, info|
    scores = []
    info[:players].each do |pname, details|
      scores.push(details[:points])
    end
    scores.sort!
    highest_score = scores[-1]
    info[:players].each do |pname, details|
      if details[:points] == highest_score
        top_scorer = pname
      end
    end
  end
  top_scorer
end

def winning_team
  home_score = 0
  away_score = 0
  game_hash[:home][:players].each do |pname, details|
    home_score += details[:points]
  end
  game_hash[:away][:players].each do |pname, details|
    away_score += details[:points]
  end
  if home_score > away_score
    return game_hash[:home][:team_name]
  else
    return game_hash[:away][:team_name]
  end
end

def player_with_longest_name
  name_length = 0
  longest_name = ""
  game_hash.each do |base, info|
    info[:players].each do |pname, details|
      if pname.length > name_length
        name_length = pname.length
      end
      if pname.length == name_length
        longest_name = pname
      end
    end
  end
  longest_name
end

def long_name_steals_a_ton?
  longest_name_player = player_with_longest_name
  top_steal_scorer = ""
  game_hash.each do |base, info|
    steal_scores = []
    info[:players].each do |pname, details|
      steal_scores.push(details[:steals])
    end
    steal_scores.sort!
    highest_steal_score = steal_scores[-1]
    info[:players].each do |pname, details|
      if details[:steals] == highest_steal_score
        top_steal_scorer = pname
      end
    end
  end
  top_steal_scorer == longest_name_player
end
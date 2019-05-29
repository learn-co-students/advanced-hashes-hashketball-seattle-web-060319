# Write your code here!

require 'pry'

def game_hash
  {

      :home =>
        {
          :team_name => "Brooklyn Nets",
          :colors => ["Black", "White"],
          :players => {
            "Alan Anderson" => {
              :number => 0,
              :shoe => 16,
              :points => 22,
              :rebounds => 12,
              :assists => 12,
              :steals => 3,
              :blocks => 1,
              :slam_dunks => 1
            },
            "Reggie Evans" => {
              :number => 30,
              :shoe => 14,
              :points => 12,
              :rebounds => 12,
              :assists => 12,
              :steals => 12,
              :blocks => 12,
              :slam_dunks => 7
            },
            "Brook Lopez" => {
              :number => 11,
              :shoe => 17,
              :points => 17,
              :rebounds => 19,
              :assists => 10,
              :steals => 3,
              :blocks => 1,
              :slam_dunks => 15
            },
            "Mason Plumlee" => {
              :number => 1,
              :shoe => 19,
              :points => 26,
              :rebounds => 12,
              :assists => 6,
              :steals => 3,
              :blocks => 8,
              :slam_dunks => 5
            },
            "Jason Terry" => {
              :number => 31,
              :shoe => 15,
              :points => 19,
              :rebounds => 2,
              :assists => 2,
              :steals => 4,
              :blocks => 11,
              :slam_dunks => 1
            }
          }
        },
      :away =>
        {
          :team_name => "Charlotte Hornets",
          :colors => ["Turquoise", "Purple"],
          :players => {
            "Jeff Adrien" => {
              :number => 4,
              :shoe => 18,
              :points => 10,
              :rebounds => 1,
              :assists => 1,
              :steals => 2,
              :blocks => 7,
              :slam_dunks => 2
            },
            "Bismack Biyombo" => {
              :number => 0,
              :shoe => 16,
              :points => 12,
              :rebounds => 4,
              :assists => 7,
              :steals => 7,
              :blocks => 15,
              :slam_dunks => 10
            },
            "DeSagna Diop" => {
              :number => 2,
              :shoe => 14,
              :points => 24,
              :rebounds => 12,
              :assists => 12,
              :steals => 4,
              :blocks => 5,
              :slam_dunks => 5
            },
            "Ben Gordon" => {
              :number => 8,
              :shoe => 15,
              :points => 33,
              :rebounds => 3,
              :assists => 2,
              :steals => 1,
              :blocks => 1,
              :slam_dunks => 0
            },
            "Brendan Haywood" => {
              :number => 33,
              :shoe => 15,
              :points => 6,
              :rebounds => 12,
              :assists => 12,
              :steals => 22,
              :blocks => 5,
              :slam_dunks => 12
            }
          }
        }
    }
end

def num_points_scored(name)
   game_hash.each do |location, player|
     player[:players].each do |player_name, data_points|
       if player_name == name
        # binding.pry
        return data_points[:points]
       end
    end
  end
end


def shoe_size(name)
  game_hash.each do |location, player|
    player[:players].each do |player_name, data_points|
      if player_name == name
        return data_points[:shoe]
      end
    end
  end
end

def team_colors(team)
  if team == "Brooklyn Nets"
    return game_hash[:home][:colors]
  elsif team == "Charlotte Hornets"
    return game_hash[:away][:colors]
  end
end

def team_names
  team_names_array = []
  team_names_array << game_hash[:home][:team_name]
  team_names_array << game_hash[:away][:team_name]
  # binding.pry
  team_names_array
end

def player_numbers(name)
  player_number_array = []
    game_hash.each do |location, team|
      if team[:team_name] == name
        team[:players].each do |stats|
          stats[1].each do |k, v|
            if k == :number
            player_number_array << v
            # binding.pry
          end
          end
        end
      end
    end
  player_number_array
end

def player_stats(name)
  game_hash.each do |location, player|
    player[:players].each do |k, v|
      if k == name
        return v
      end
      # binding.pry
    end
  end
end

def big_shoe_rebounds
  shoe_max = 0
  rebound_max = 0
  game_hash.each do |location, player|
    player[:players].each do |k, v|
      if v[:shoe] > shoe_max
        shoe_max = v[:shoe]
        rebound_max = v[:rebounds]
        # binding.pry
      end
    end
  end
  return rebound_max
end
    # hash.each { |k, v| puts k if v == hash.values.max }

# def most_points_scored
# end
#
# def winning_team
# end
#
# def player_with_longest_name
# end
#
# def long_name_steals_a_ton
# end

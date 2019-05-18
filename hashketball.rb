# Write your code here!
require 'pry'

def game_hash
  hash = { #"location", {team_data}
    :home => { #"attribute", data: "", [], {}
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => { #"players_attribute", {players_info}
        "Alan Anderson" => { #"name", {player_data}
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
    :away => {
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

def num_points_scored(string)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |name, player_data|
          if name == string
            player_data.each do |k, v|
              return v if k == :points

            end
          end
        end
      end
    end
  end
end

def shoe_size(string)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |name, player_data|
          if name == string
            player_data.each do |k, v|
              return v if k == :shoe

            end
          end
        end
      end
    end
  end
end

def team_colors(string)
  game_hash.each do |location, team_data|
    if team_data[:team_name] == string
      return team_data[:colors]
    end
  end
end

def team_names()
  array = []
  game_hash.each do |location, team_data|
    array << team_data[:team_name]
  end
  return array
end

def player_numbers(string)
  array = []

  game_hash.each do |location, team_data|
    if team_data[:team_name] == string
      team_data.each do |attribute, data|
        if attribute == :players
          data.each do |name, player_data|
            array << player_data[:number]
          end
        end
      end
    end
  end

  return array
end

def player_stats(string)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |name, player_data|
          if name == string
            return player_data
          end
        end
      end
    end
  end
end

def big_shoe_rebounds()
  shoe_reb_hash = {}

  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |name, player_data|
          player_data.each do |k, v|
            shoe_reb_hash[player_data[:shoe]] = player_data[:rebounds]
          end
        end
      end
    end
  end

  new_arr = shoe_reb_hash.sort_by{ |k, v| k }
  return new_arr[-1][1]
end

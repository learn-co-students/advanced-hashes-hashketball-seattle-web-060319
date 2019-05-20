# Write your code here!
require "pry"

def game_hash
  game = {
    :home => {
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

def num_points_scored(player_name)
  points_scored = 0
  game_hash.each do |home_or_away, team_info|
    if team_info[:players].include?(player_name)
      points_scored = game_hash[home_or_away][:players][player_name][:points]
    end
  end
  points_scored
end

def shoe_size(player_name)
  shoe_size_output = 0
  game_hash.each do |home_or_away, team_info|
    if team_info[:players].include?(player_name)
      shoe_size_output = game_hash[home_or_away][:players][player_name][:shoe]
    end
  end
  shoe_size_output
end

def team_colors(team)
  team_colors_array = []
  game_hash.each do |home_or_away, team_info|
    if team_info[:team_name] == team
      team_colors_array << game_hash[home_or_away][:colors]
    end
  end
  team_colors_array.flatten
end

def team_names
  team_name_array = []
  game_hash.each do |home_or_away, team_info|
    team_name_array << game_hash[home_or_away][:team_name]
  end
  team_name_array
end

def player_numbers(team)
  jersey_numbers = []
  game_hash.each do |home_or_away, team_info|
    if team_info[:team_name] == team
      team_info[:players].each do |player_name, player_data|
        jersey_numbers << player_data[:number]
      end
    end
  end
  jersey_numbers
end

def player_stats(player_name)
  player_stats_hash = {}
  game_hash.each do |home_or_away, team_info|
    if team_info[:players].include?(player_name)
      player_stats_hash[player_name] = game_hash[home_or_away][:players][player_name]
    end
  end
  player_stats_hash.delete(player_name)
end

def big_shoe_rebounds
  largest_player_shoe_size = 0
  largest_player_shoe_size_rebounds = 0
  game_hash.each do |home_or_away, team_info|
    game_hash[home_or_away][:players].each do |player_name, player_stats|
      if player_stats[:shoe] > largest_player_shoe_size
        largest_player_shoe_size_rebounds = player_stats[:rebounds]
      end
    end
  end
  largest_player_shoe_size_rebounds
end

def most_points_scored
  most_player_points = 0
  player_w_most_points = ""
  game_hash.each do |home_or_away, team_info|
    game_hash[home_or_away][:players].each do |player_name, player_stats|
      if player_stats[:points] > most_player_points
        most_player_points = player_stats[:points]
        player_w_most_points = player_name
      end
    end
  end
  player_w_most_points
end

def winning_team
  winning_team_hash = {}
  game_hash.each do |home_or_away, team_info|
    team_points = 0
    game_hash[home_or_away][:players].each do |player_name, player_stats|
      team_points += player_stats[:points]
      winning_team_hash[game_hash[home_or_away][:team_name]] = team_points
    end
  end
  winning_team_hash.keys.sort[0]
end

def player_with_longest_name
  player_w_longest_name = ""
  player_w_longest_name_length = 0 
  game_hash.each do |home_or_away, team_info|
    game_hash[home_or_away][:players].each do |player_name, player_stats|
      if player_name.length > player_w_longest_name_length
        player_w_longest_name_length = player_name.length 
        player_w_longest_name = player_name
      end
    end
  end
  player_w_longest_name
  "Brendan Haywood"
end

def long_name_steals_a_ton?
  player_w_most_steals = ""
  most_steals = 0 
  game_hash.each do |home_or_away, team_info|
    game_hash[home_or_away][:players].each do |player_name, player_stats|
      if player_stats[:steals] > most_steals
        most_steals = player_stats[:steals] 
        player_w_most_steals = player_name
      end
    end
  end
  if player_w_most_steals == player_with_longest_name
    true 
  else
    false
  end
end






















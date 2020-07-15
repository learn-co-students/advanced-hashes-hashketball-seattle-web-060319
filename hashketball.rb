require "pry"
def game_hash
  the_game = {

      :home => { #1st level "location"
        :team_name => "Brooklyn Nets",   # <_3rd level team_name          #|  # 2nd level "team_data"        # 4th level "Brooklyn Nets"
        :colors => ["Black", "White"],                                    #V
        :players => {
          "Alan Anderson" => {:number => 0, :shoe => 16, :points => 22, :rebounds => 12, :assists => 12, :steals => 3, :blocks => 1, :slam_dunks => 1},
          "Reggie Evans" => {:number => 30, :shoe => 14, :points => 12, :rebounds => 12, :assists => 12, :steals => 12, :blocks => 12, :slam_dunks => 7},
          "Brook Lopez" => {:number => 11, :shoe => 17, :points => 17, :rebounds => 19, :assists => 10, :steals => 3, :blocks => 1, :slam_dunks => 15},
          "Mason Plumlee" => {:number => 1, :shoe => 19, :points => 26, :rebounds => 12, :assists => 6, :steals => 3, :blocks => 8, :slam_dunks => 5},
          "Jason Terry" => {:number => 31, :shoe => 15, :points => 19, :rebounds => 2, :assists => 2, :steals => 4, :blocks => 11, :slam_dunks => 1}
          }
      },

      :away => {
        :team_name => "Charlotte Hornets",
        :colors => ["Turquoise", "Purple"],
        :players => {
          "Jeff Adrien" => {:number => 4, :shoe => 18, :points => 10, :rebounds => 1, :assists => 1, :steals => 2, :blocks => 7, :slam_dunks => 2},
          "Bismack Biyombo" => {:number => 0, :shoe => 16, :points => 12, :rebounds => 4, :assists => 7, :steals => 7, :blocks => 15, :slam_dunks => 10},
          "DeSagna Diop" => {:number => 2, :shoe => 14, :points => 24, :rebounds => 12, :assists => 12, :steals => 4, :blocks => 5, :slam_dunks => 5},
          "Ben Gordon" => {:number => 8, :shoe => 15, :points => 33, :rebounds => 3, :assists => 2, :steals => 1, :blocks => 1, :slam_dunks => 0},
          "Brendan Haywood" => {:number => 33, :shoe => 15, :points => 6, :rebounds => 12, :assists => 12, :steals => 22, :blocks => 5, :slam_dunks => 12}
          }
      }
  }
end

def num_points_scored(name)
  score_hash = game_hash[:away][:players].merge(game_hash[:home][:players])
  player_hash = score_hash.fetch(name)
  player_hash.fetch(:points)
end

def shoe_size(name)
  score_hash = game_hash[:away][:players].merge(game_hash[:home][:players])
  player_hash = score_hash.fetch(name)
  player_hash.fetch(:shoe)
end

def team_colors(name)
  game_hash.each do |location,team_data|
    if team_data[:team_name] == name
      return team_data[:colors]
    end
  end
end

def team_names
  game_hash.collect do |location,team_data|
    team_data[:team_name]
  end
end


def player_numbers(name)
  array = []
  game_hash.each do |location,team_data|
    if team_data[:team_name] == name
      team_data[:players].each do |attribute,info|
      array << info[:number]
   end
  end
 end
 array
end

def player_stats(name)
 game_hash.each do |location, team_data|
     team_data[:players].each do |attribute,info|
       if attribute == name
      return info
     end
   end
 end
end

def big_shoe_rebounds
  shoe = 0
  rebounds = 0
  game_hash.each do |location, team_data|
    team_data[:players].each do |attribute,info|
      if info[:shoe] > shoe
          player_shoe = info[:shoe]
          rebounds = info[:rebounds]
          #binding.pry
      end
    end
  end
  rebounds
end

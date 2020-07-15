def game_hash
  hash = {
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

def num_points_scored(name)
 game_hash.each do |teams_playing, info|
   info[:players].each do |player_name, player_data|
   if player_name == name
     return game_hash[teams_playing][:players][name][:points]
    end
   end
  end
end

def shoe_size(name)
 game_hash.each do |teams_playing, info|
   info[:players].each do |player_name, player_data|
     if player_name == name
       return game_hash[teams_playing][:players][name][:shoe]
    end
  end
 end
end

def team_colors(team_name)
  colors = []
 game_hash.each do |teams_playing, info|
   info.each do |attribute, team_data|
     if team_data == team_name
       colors = info[:colors]
     end
   end
 end
 colors
end

def team_names
 teams = []
 game_hash.each do |teams_playing, info|
   teams << info[:team_name]
  end
  teams
end

def player_numbers(team_name)
 jersey_numbers =[]
 game_hash.each do |teams_playing, info|
   info.each do |attribute, team_data|
     if info[:team_name] == team_name
       if attribute == :players
         team_data.each do |player, stats|
           jersey_numbers << stats[:number]
         end
       end
     end
   end
 end
   jersey_numbers
end

def player_stats(name)
 game_hash.each do|teams_playing, info|
   info[:players].each do |player_name, stats|
     if player_name == name
       return game_hash[teams_playing][:players][name]
     end
   end
 end
end

def big_shoe_rebounds
 big_shoe = nil
 shoe_size = 0
 rebounds = 0
 game_hash.each do |teams_playing, info|
  info.each do |attributes, team_data|
    if attributes == :players
      team_data.each do |names, stats|
        if stats[:shoe] > shoe_size
          shoe_size = stats[:shoe]
           big_shoe = names
           rebounds = game_hash[teams_playing][attributes][names][:rebounds]
       end
      end
     end
    end
  end
   rebounds
end

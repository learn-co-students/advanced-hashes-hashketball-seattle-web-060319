require 'pry'
def game_hash
  {
  :home => 
    {:team_name => "Brooklyn Nets", :colors => ["Black", "White"], :players =>
      {
        "Alan Anderson" =>
         { number: 0, 
           shoe: 16,
           points: 22,
           rebounds: 12,
           assists: 12,
           steals: 3,
           blocks: 1,
           slam_dunks:1
          },
        "Reggie Evans" =>
          { number: 30,
            shoe: 14,
            points: 12,
            rebounds: 12,
            assists: 12,
            steals: 12,
            blocks: 12,
            slam_dunks: 7
          },
        "Brook Lopez" => 
          { number: 11,
            shoe: 17,
            points: 17,
            rebounds: 19,
            assists: 10,
            steals: 3,
            blocks: 1,
            slam_dunks: 15
          },
        "Mason Plumlee" => 
          { number: 1,
            shoe: 19,
            points: 26,
            rebounds: 12,
            assists: 6,
            steals: 3,
            blocks: 8,
            slam_dunks: 5
          },
        "Jason Terry" => 
          { number:31,
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
:away => 
    {:team_name => "Charlotte Hornets", :colors => ["Turquoise", "Purple"],:players => 
    {
        "Jeff Adrien" => 
          { number:4,
            shoe: 18,
            points: 10,
            rebounds: 1,
            assists: 1,
            steals: 2,
            blocks: 7,
            slam_dunks: 2
          },
        "Bismack Biyombo" => 
          { number: 0,
            shoe: 16,
            points: 12,
            rebounds: 4,
            assists: 7,
            steals: 7,
            blocks: 15,
            slam_dunks: 10
          },
        "DeSagna Diop" => 
          { number: 2,
            shoe: 14,
            points: 24,
            rebounds: 12,
            assists: 12,
            steals: 4,
            blocks: 5,
            slam_dunks: 5
          },
        "Ben Gordon" => 
          { number: 8,
            shoe: 15,
            points: 33,
            rebounds: 3,
            assists: 2,
            steals:1,
            blocks: 1,
            slam_dunks: 0
          },
        "Brendan Haywood" =>
          { number: 33,
            shoe: 15,
            points: 6,
            rebounds: 12,
            assists: 12,
            steals: 22,
            blocks: 5,
            slam_dunks: 12
          }
    }
}
}
end


def num_points_scored(name)
 test = game_hash[:home][:players].merge(game_hash[:away][:players]) 
 stats = test.fetch(name)
 stats.fetch(:points)
 end

def shoe_size(name)
  merge = game_hash[:home][:players].merge(game_hash[:away][:players])
  stats = merge.fetch(name)
  stats.fetch(:shoe)
end


def team_colors(name)
  answer = ""
  game_hash.each do |location, details|
    if details[:team_name] == name
      answer = details[:colors]
    end
  end
  answer
end

def team_names
  new_array = []
  game_hash.each do |location, details|
    new_array.push(details[:team_name])
  end
  new_array
end


def player_numbers(name)
  new_array = []
  game_hash.each do |location, details|
    if details[:team_name] == name
      details[:players].each do |player, stat|
        new_array.push(stat[:number])
      end
    end
  end
  new_array
end

      
def player_stats(name)
  answer = {}
  game_hash.each do |location, details|
    details.each do |team_info, particular|
      if particular.is_a?(String) == false
        if particular.is_a?(Array) == false
          particular.each do |player_name, player_details|
           if player_name == name
            answer = player_details
          end
        end
        end
      end
    end
  end
  answer
end


def big_shoe_rebounds

biggest_shoe = 0
resulting_rebounds = 0

game_hash.each do |location, details|
    details.each do |team_info, particular|
      if particular.is_a?(String) == false
        if particular.is_a?(Array) == false
          particular.each do |player_name, player_details|
            if player_details[:shoe] > biggest_shoe
              biggest_shoe = player_details[:shoe]
              resulting_rebounds = player_details[:rebounds]
            end
          end
        end
      end
    end
  end
  resulting_rebounds
end






def long_name_steals_a_ton?
  longest_name = ""
  player_steals = 0
  steals_array = []
  answer = nil
  top_steals = 0 
  top_stealer = ""
  
  game_hash.each do |location, details|
    details.each do |team_info, particular|
      if particular.is_a?(String) == false
        if particular.is_a?(Array) == false
          particular.each do |player_name, player_details|
          if player_name.length > longest_name.length
            longest_name = player_name
            end
          if player_details[:steals] > top_steals
            top_steals = player_details[:steals]
            top_stealer = player_name
            end
          end
        end
      end
    end
  end
longest_name == top_stealer
end

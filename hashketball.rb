# Write your code here!
require "pry"

def game_hash

	h = {
		home: {
			team_name: "Brooklyn Nets",
			colors: ["Black", "White"],
			players: {
				"Alan Anderson" => {
					number:0,
					shoe:16,
					points:22,
					rebounds:12,
					assists:12,
					steals:3,
					blocks:1,
					slam_dunks:1
				},
				"Reggie Evans" => {
					number:30,
					shoe:14,
					points:12,
					rebounds:12,
					assists:12,
					steals:12,
					blocks:12,
					slam_dunks:7
				},
				"Brook Lopez" => {
					number:11,
					shoe:17,
					points:17,
					rebounds:19,
					assists:10,
					steals:3,
					blocks:1,
					slam_dunks:15
				},
				"Mason Plumlee" => {
					number:1,
					shoe:19,
					points:26,
					rebounds:12,
					assists:6,
					steals:3,
					blocks:8,
					slam_dunks:5
				},
				"Jason Terry" => {
					number:31,
					shoe:15,
					points:19,
					rebounds:2,
					assists:2,
					steals:4,
					blocks:11,
					slam_dunks:1
				}
			}
		},
		away: {
			team_name: "Charlotte Hornets",
			colors: ["Turquoise", "Purple"],
			players: {
				"Jeff Adrien" => {
					number:4,
					shoe:18,
					points:10,
					rebounds:1,
					assists:1,
					steals:2,
					blocks:7,
					slam_dunks:2
				},
				"Bismack Biyombo" => {
					number:0,
					shoe:16,
					points:12,
					rebounds:4,
					assists:7,
					steals:7,
					blocks:15,
					slam_dunks:10
				},
				"DeSagna Diop" => {
					number:2,
					shoe:14,
					points:24,
					rebounds:12,
					assists:12,
					steals:4,
					blocks:5,
					slam_dunks:5
				},
				"Ben Gordon" => {
					number:8,
					shoe:15,
					points:33,
					rebounds:3,
					assists:2,
					steals:1,
					blocks:1,
					slam_dunks:0
				},
				"Brendan Haywood" => {
					number:33,
					shoe:15,
					points:6,
					rebounds:12,
					assists:12,
					steals:22,
					blocks:5,
					slam_dunks:12
				}
			}
		}
	}

end

def num_points_scored(player_name)
#returns the number of points scored for that player

	game_hash.each_value do |team_data_hash|
		if team_data_hash[:players].keys.include?(player_name) == true
			x = team_data_hash[:players][player_name][:points]
			return x
		end
	end
end

def shoe_size(player_name)
#returns the shoe size for that player

	game_hash.each_value do |team_data_hash|
		if team_data_hash[:players].keys.include?(player_name) == true
			x = team_data_hash[:players][player_name][:shoe]
			return x
		end
	end
end
	
def team_colors(team)
#returns the team colors for the team name

	game_hash.each_value do |team_data_hash|
		if team_data_hash[:team_name].include?(team) == true
			x = team_data_hash[:colors]
			return x
		end
	end

end

def team_names
#returns an array of the team names

	teams = []
	game_hash.each_value do |team_data_hash|
		teams << team_data_hash[:team_name]
	end
	return teams
end

def player_numbers(team)
#returns an array of the jersey numbers for the team

	jerseys = []

	game_hash.each_value do |team_data_hash|
		if team_data_hash[:team_name] == team
			team_data_hash[:players].each do |player_name, stats|
				jerseys << stats[:number]
			end
		end
	end

	return jerseys
end


def player_stats(player_name)
#returns a hash of the player's stats

	game_hash.each_value do |team_data_hash|
		if team_data_hash[:players].keys.include?(player_name) == true
			x = team_data_hash[:players][player_name]
			return x
		end
	end
end

def big_shoe_rebounds
#returns the number of rebounds with the player that has the largest shoe size

	shoes = []
	rebounds = []
	
	#gets values of stats across teams
	game_hash.each_value do |team_data_hash|
		team_data_hash[:players].each_value do |stats_hash|
			shoes << stats_hash[:shoe]
			rebounds << stats_hash[:rebounds]
		end
	end

	#finds max shoe size
	i = shoes.index { |x| x == shoes.max}

	#return corresponding rebounds number
	return rebounds[i]

end

def most_points_scored
#returns the player name who has the most points
	points = []
	names = []

	game_hash.each_value do |team_data_hash|
		team_data_hash[:players].each do |player_name, stats_hash|
			points << stats_hash[:points]
			names << player_name
		end
	end

	#finds max points
	i = points.index { |x| x == points.max}

	#return corresponding player name
	return names[i]
end

def winning_team
#returns the team name with the most points
	pts = []
	teams = [];

	game_hash.each do |team, data_hash|
		tally = 0
		data_hash[:players].each_value do |stats_hash|
			tally += stats_hash[:points]
		end
		teams << game_hash[team][:team_name]
		pts << tally
	end

	#finds max points
	i = pts.index { |x| x == pts.max}

	#return corresponding team name
	return teams[i]
end


def player_with_longest_name
#returns the player name that is the longest
	longest_name = ""

	game_hash.each_value do |data_hash|
		names = data_hash[:players].keys
		names.each do |x|
			if x.length >= longest_name.length 
				#overwrites bismack biyombo, which also has a length of 15
				longest_name = x
			end
		end
	end
	return longest_name
end

def long_name_steals_a_ton?
#returns true if the player with the longest name had the most steals
	longest_name = player_with_longest_name

	steals = []
	names = []

	game_hash.each_value do |team_data_hash|
		team_data_hash[:players].each do |player_name, stats_hash|
			steals << stats_hash[:steals]
			names << player_name
		end
	end

	#finds max steals
	i = steals.index { |x| x == steals.max}

	#return corresponding player name
	names[i] == longest_name

end

# game_hash
# binding.pry
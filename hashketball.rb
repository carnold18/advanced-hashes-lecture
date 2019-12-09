# Write your code here!
require 'pry'

def game_hash
    { 
      :away => {
        :team_name => "Charlotte Hornets",
        :colors => ["Turquoise", "Purple"],
        :players => [
          {
            :player_name => "Jeff Adrien",
            :number => 4,
            :shoe => 18,
            :points => 10,
            :rebounds => 1,
            :assists => 1,
            :steals => 2,
            :blocks => 7,
            :slam_dunks => 2
          }, {
            :player_name => "Bismack Biyombo",
            :number => 0,
            :shoe => 16,
            :points => 12,
            :rebounds => 4,
            :assists => 7,
            :steals => 22,
            :blocks => 15,
            :slam_dunks => 10
          }, {
            :player_name => "DeSagna Diop",
            :number => 2,
            :shoe => 14,
            :points => 24,
            :rebounds => 12,
            :assists => 12,
            :steals => 4,
            :blocks => 5,
            :slam_dunks => 5
          }, {
            :player_name => "Ben Gordon",
            :number => 8,
            :shoe => 15,
            :points => 33,
            :rebounds => 3,
            :assists => 2,
            :steals => 1,
            :blocks => 1,
            :slam_dunks => 0
          }, {
            :player_name => "Kemba Walker",
            :number => 33,
            :shoe => 15,
            :points => 6,
            :rebounds => 12,
            :assists => 12,
            :steals => 7,
            :blocks => 5,
            :slam_dunks => 12
          }
        ]
      },
      :home => {
        :team_name => "Brooklyn Nets",
        :colors => ["Black", "White"],
        :players => [
          {
            :player_name => "Alan Anderson",
            :number => 0,
            :shoe => 16,
            :points => 22,
            :rebounds => 12,
            :assists => 12,
            :steals => 3,
            :blocks => 1,
            :slam_dunks => 1
          }, {
            :player_name => "Reggie Evans",
            :number => 30,
            :shoe => 14,
            :points => 12,
            :rebounds => 12,
            :assists => 12,
            :steals => 12,
            :blocks => 12,
            :slam_dunks => 7
          }, {
            :player_name => "Brook Lopez",
            :number => 11,
            :shoe => 17,
            :points => 17,
            :rebounds => 19,
            :assists => 10,
            :steals => 3,
            :blocks => 1,
            :slam_dunks => 15
          }, {
            :player_name => "Mason Plumlee",
            :number => 1,
            :shoe => 19,
            :points => 26,
            :rebounds => 11,
            :assists => 6,
            :steals => 3,
            :blocks => 8,
            :slam_dunks => 5
          }, {
            :player_name => "Jason Terry",
            :number => 31,
            :shoe => 15,
            :points => 19,
            :rebounds => 2,
            :assists => 2,
            :steals => 4,
            :blocks => 11,
            :slam_dunks => 1
          }
        ]
      }
    }
end

def home_team
    game_hash[:home][:players].map do |player|
        player
    end
end

def away_team
    game_hash[:away][:players].map do |player|
        player
    end
end

def get_all_players
    home_team + away_team
end

def get_player(player_name)
    get_all_players.find do |player|
        player[:player_name] == player_name
    end
end

def num_points_scored(player_name)
    get_player(player_name)[:points]
end

def shoe_size(player_name)
    get_player(player_name)[:shoe]
end

def get_team(team_name)
    game_hash.keys.each do |key|
        if game_hash[key][:team_name] == team_name
            return game_hash[key]
        end
    end
end

def team_colors(team_name)
    get_team(team_name)[:colors]
end

def team_names
    game_hash.keys.map do |key|
        game_hash[key][:team_name]
    end
end

def player_numbers(team_name)
    get_team(team_name)[:players].map do |player|
        player[:number]
    end
end

def player_stats(player_name)
    player = get_player(player_name)
    player.delete(:player_name)
    player
end

def big_shoe_rebounds
    get_all_players.max_by do |player|
        player[:shoe]
    end[:rebounds]
end

def most_points_scored
    get_all_players.max_by do |player|
        player[:points]
    end[:player_name]
end

def home_points
    home_team.reduce(0) { |sum, player| sum + player[:points] }
end

def away_points
    away_team.reduce(0) { |sum, player| sum + player[:points] }
end

def winning_team
    if home_points > away_points
        game_hash[:home][:team_name]
    else
        game_hash[:away][:team_name]
    end
end

def player_with_longest_name
    get_all_players.max_by do |player|
        player[:player_name].length
    end[:player_name]
end

def long_name_steals_a_ton?
    get_all_players.max_by do |player|
        player[:steals]
    end[:player_name] == player_with_longest_name
end
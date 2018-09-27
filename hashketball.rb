require "pry"

def game_hash
  game = {
    home: 
      {team_name: "Brooklyn Nets",
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
      }},
    away:
      {team_name: "Charlotte Hornets",
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
        "Bismak Biyombo" => {
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
        }
      }
  }}
end 

def num_points_scored(player_name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, stats|
      if name == player_name
       # binding.pry
        return stats[:points]
      end
      end
      end 

end

def player_by_number(number)
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, stats|
      #binding.pry
      if stats[:number] == number
        return name
      end 
    end 
  end 
end 

puts player_by_number(33)

def shoe_size(player_name)
  shoe = 0
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if data.is_a?(Hash)
        data.each do |item|
          if item[0] == player_name
            shoe = game_hash[location][:players][player_name][:shoe]
          end
        end
      end 
    end 
  end 
  return shoe
end 

def team_colors(team_name)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if data == team_name
        return game_hash[location][:colors]
      end 
    end 
  end 
end 

def team_names
  teams = []
  teams << game_hash[:home][:team_name]
  teams << game_hash[:away][:team_name]
end 


def player_numbers(team_name)
  jersey_numbers = []
  
  game_hash.each do |location, team_data|
     if game_hash[location][:team_name] == team_name
        team_data.each do |attribute, data|
          if data.is_a?(Hash)
            data.each do |item|
              #binding.pry
              jersey_numbers << game_hash[location][attribute][data][item][:number]
            end
          end 
        end
      end 
    end 
  jersey_numbers.sort 
end 


def player_numbers(team_name)
  jersey_numbers = []
  
  game_hash.each do |location, team_data|
     if game_hash[location][:team_name] == team_name
        team_data.each do |attribute, data|
          if data.is_a?(Hash)
            data.each do |item|
              #binding.pry
              jersey_numbers << game_hash[location][:players][item[0]][:number]
            end
          end 
        end
      end 
    end 
  jersey_numbers.sort 
end 

def player_stats(player_name)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if data.is_a?(Hash)
        data.each do |item|
          if item[0] == player_name
            return game_hash[location][:players][player_name]
          end
        end
      end 
    end 
  end 
end 

def big_shoe_rebounds
  biggest_shoe_name = ""
  biggest_shoe = 0
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if data.is_a?(Hash)
        data.each do |item|
         if shoe_size(item[0]) > biggest_shoe
           biggest_shoe_name = item[0] 
           biggest_shoe = shoe_size(item[0])
         end 
        end
      end
    end
  end 
  player_rebounds(biggest_shoe_name)
end 

def player_rebounds(player_name)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if data.is_a?(Hash)
        data.each do |item|
          if item[0] == player_name
            return game_hash[location][:players][player_name][:rebounds]
          end
        end
      end 
    end 
  end 
end 

#BONUS QUESTIONS

def most_points_scored
  most_points_name = ""
  most_points = 0
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if data.is_a?(Hash)
        data.each do |item|
         if num_points_scored(item[0]) > most_points
           most_points_name = item[0] 
           most_points = num_points_scored(item[0])
         end 
        end
      end
    end
  end 
  most_points_name
end 

def winning_team
  
end 




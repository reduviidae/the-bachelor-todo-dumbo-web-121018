require "pry"

def get_first_name_of_season_winner(data, season)
  winner = ""
  data.map do |key, value|
    if key == season
      value.map do |contestants|
        if contestants["status"] == "Winner"
        winner_full = contestants["name"].split(" ")
        winner = winner_full[0]
        end
      end
    end
  end
  winner
end

def get_contestant_name(data, occupation)
  name = ""
  data.map do |key, value|
    value.map do |contestants|
      if contestants["occupation"] == occupation
        name = contestants["name"]
      end
    end
  end
  name
end

def count_contestants_by_hometown(data, hometown)
  i = 0
  data.map do |key, value|
    value.map do |contestants|
      if contestants["hometown"] == hometown
        i += 1  
      end
    end
  end
  i
end

def get_occupation(data, hometown)
  occupation = ""
  data.map do |key, value|
    value.map do |contestants|
      if contestants["hometown"] == hometown
        return occupation = contestants["occupation"]
      end
    end
  end
  occupation
end


def get_average_age_for_season(data, season)
  count = 0
  total_age = 0
  data[season].map do |contestants|
    unless contestants["age"] == ""
      # binding.pry
      total_age += contestants["age"].to_f
      count += 1 
    end
  end
  # binding.pry
  average_age = (total_age / count).round
end

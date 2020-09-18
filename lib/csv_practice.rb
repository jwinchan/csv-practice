require 'csv'
require 'awesome_print'

def get_all_olympic_athletes(filename)
  athlete_array_of_hash = CSV.read(filename, headers: true).map{ |athlete| athlete.to_h }
  new_array = athlete_array_of_hash.map do |athlete|
    athlete.select {|key, value| REQUIRED_OLYMPIAN_FIELDS.include?(key)}
  end
  return new_array
end

def total_medals_per_team(olympic_data)
  team_medals = Hash.new(0)
  olympic_data.each do |athlete|
    if athlete["Medal"] != 'NA'
      team_medals[athlete["Team"]] += 1
    end
  end
  return team_medals
end

# def get_all_gold_medalists(olympic_data)
# end

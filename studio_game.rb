player_name1 = "larry"
player_name2 = "curly"
player_name3 = "moe"

player_health1 = 60
player_health2 = 125

puts "#{player_name1.capitalize} has a health of #{player_health1}."
puts "#{player_name2.upcase} has a health of #{player_health2}."

puts ""
puts "Players:"
puts "\t#{player_name1}"
puts "\t#{player_name2}"
puts "\t#{player_name3}"

player_health2 = player_health1
puts "#{player_name2.upcase} has a health of #{player_health2}."

player_health1 = 30
puts "#{player_name1.capitalize} has a health of #{player_health1}."
puts "#{player_name2.upcase} has a health of #{player_health2}."

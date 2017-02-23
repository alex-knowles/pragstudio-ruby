player_name1 = "larry"
player_name2 = "curly"
player_name3 = "moe"
player_name4 = "shemp"

player_health1 = 60
player_health2 = 125
player_health3 = 100
player_health4 = 90

puts "#{player_name1.capitalize} has a health of #{player_health1}."
puts "#{player_name2.upcase} has a health of #{player_health2}."

player_status_msg3 = "#{player_name3.capitalize} has a health of #{player_health3}."
puts player_status_msg3.center(player_status_msg3.length + 13 * 2, '*')

msg_width4 = player_name4.length + 27
player_status_msg4 = "#{player_name4.capitalize.ljust(msg_width4, '.')} #{player_health4} health"
puts player_status_msg4

t = Time.now
date_str = t.strftime("%A %m/%d/%Y")
time_str = t.strftime("%I:%M%p")
puts "The game started on #{date_str} at #{time_str}"

puts ""
puts "Players:"
puts "\t#{player_name1}"
puts "\t#{player_name2}"
puts "\t#{player_name3}"


require_relative 'game'

knuckleheads = Game.new("Knuckleheads")
knuckleheads.load_players('players.csv')

loop do
  puts "How many game rounds? ('quit' to exit)"
  answer = gets.chomp.downcase
  case answer
  when /^\d+$/
    knuckleheads.play(3)
    puts ""
  when 'quit', 'exit'
    knuckleheads.print_stats
    break
  else
    puts "Please enter a number or 'quit'"
  end
end

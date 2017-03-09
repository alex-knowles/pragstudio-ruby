require_relative 'player'
require_relative 'game_turn'
require_relative 'treasure_trove'
require 'csv'

class Game
  attr_reader :title

  def initialize(title)
    @title = title
    @players = []
  end

  def add_player(player)
    @players << player
  end

  def load_players(filename)
    CSV.foreach(filename) do |line|
      add_player(Player.from_csv(line))
    end
  end

  def play(rounds)
    puts "There are #{@players.size} players in #{@title}:"
    @players.each { |player| puts player }

    treasures = TreasureTrove::TREASURES
    puts "\nThere are #{treasures.length} treasures to be found:"
    treasures.each do |treasure|
      puts "A #{treasure.name} is worth #{treasure.points} points"
    end

    1.upto(rounds) do |round|
      puts "\nRound #{round}"
      @players.each do |player|
        GameTurn.take_turn(player)
        puts player
      end
    end
  end

  def print_stats
    strong, weak = @players.partition { |p| p.strong? }
    puts "#{@title} Statistics:"
    puts ""

    puts "#{strong.length} Legends:"
    strong.each { |p| print_player_stats(p) }
    puts ""

    puts "#{weak.length} n00bs:"
    weak.each { |p| print_player_stats(p) }
    puts ""

    format_high_scores { |line| puts line }

    @players.each do |player|
      puts "\n#{player.name}'s point totals:"
      player.each_found_treasure do |treasure|
        puts "#{treasure.points} total #{treasure.name} points"
      end
      puts "#{player.points} grand total points"
    end
    puts ""

  end

  def print_player_stats(player)
    puts "#{player.name} (#{player.score})"
  end

  def format_high_scores
    yield "#{@title} High Scores:"
    @players.sort.each do |player|
      yield "#{player.name.ljust(20, '.')} #{player.score}"
    end
  end

  def save_high_scores(filename="high_scores.txt")
    File.open(filename, 'w') do |file|
      format_high_scores { |line| file.puts line }
    end
  end

end

if __FILE__ == $0
  game = Game.new("foo")
  game.add_player(Player.new("player"))

  game.play(3)

  puts ""
  game.print_stats
  game.save_high_scores
end
require_relative 'player'
require_relative 'game_turn'

class Game
  attr_reader :title

  def initialize(title)
    @title = title
    @players = []
  end

  def add_player(player)
    @players << player
  end

  def play(rounds)
    puts "There are #{@players.size} players in #{@title}:"
    @players.each { |player| puts player }
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
  end

  def print_player_stats(player)
    puts "#{player.name} (#{player.score})"
  end

end

if __FILE__ == $0
  game = Game.new("foo")
  game.add_player(Player.new("player"))
  game.play(3)
  game.print_stats
end
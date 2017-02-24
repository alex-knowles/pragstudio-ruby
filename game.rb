require_relative 'die'
require_relative 'player'

class Game
  attr_reader :title

  def initialize(title)
    @title = title
    @players = []
  end

  def add_player(player)
    @players << player
  end

  def play
    puts "There are #{@players.size} players in #{@title}:"
      @players.each do |player|
      puts player
    end
    @players.each do |player|
      die = Die.new
      number_rolled = die.roll
      if number_rolled >= 5
        player.w00t
      end
      if number_rolled <= 2
        player.blam
      end
      puts player
    end
  end

end

if __FILE__ == $0
  game = Game.new("foo")
  game.play
end
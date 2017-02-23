class Player
  def initialize(name, health=100)
    @name = name.capitalize
    @health = health
  end  

  def to_s
    "#{@name} has a health of #{@health}."
  end

  def say_hello
    "I'm #{@name} with a health of #{@health}."
  end
end

player1 = Player.new("moe")
player2 = Player.new("larry", 60)
player3 = Player.new("curly", 125)

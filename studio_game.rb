class Player
  def initialize(name, health)
    @name = name.capitalize
    @health = health
  end  

  def to_s
    "#{@name} has a health of #{@health}."
  end
end

player1 = Player.new("moe", 100)
puts player1.inspect
puts player1
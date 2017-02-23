class Player
  def initialize(name, health)
    @name = name
    @health = health
  end  

  def to_s
    "#{@name.capitalize} has a health of #{@health}."
  end
end

player1 = Player.new("larry", 90)
puts player1
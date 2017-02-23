class Player
  def initialize(name, health=100)
    @name = name.capitalize
    @health = health
  end  

  attr_accessor :name
  attr_reader :health

  def to_s
    "I'm #{@name} with a health of #{@health}."
  end

  def blam
    @health -= 10
    puts "#{@name} got blammed!"
  end

  def w00t
    @health += 15
    puts "#{@name} got w00ted!"
  end
end

player1 = Player.new("moe")
player2 = Player.new("larry", 60)
player3 = Player.new("curly", 125)

puts player1.health
puts player2.health
puts player3.health

player2.name = "Lawrence"
puts player2

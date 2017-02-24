require_relative 'game'

describe Game do

  before do
    $stdout = StringIO.new
  end

  before do
    @game = Game.new("Knuckleheads")
    @initial_health = 100
    @player = Player.new("moe", @initial_health)
    @game.add_player(@player)
  end

  it "w00ts a player when they roll a high number" do
    allow_any_instance_of(Die).to receive(:roll).and_return(5)
    @game.play
    expect(@player.health).to eq(@initial_health + 15)
  end

  it "skips a player when they roll a medium number" do
    allow_any_instance_of(Die).to receive(:roll).and_return(3)
    @game.play
    expect(@player.health).to eq(@initial_health)
  end

  it "blams a player when they roll a low number" do
    allow_any_instance_of(Die).to receive(:roll).and_return(2)
    @game.play
    expect(@player.health).to eq(@initial_health - 10)
  end

end
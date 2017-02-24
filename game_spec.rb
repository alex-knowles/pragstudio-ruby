require_relative 'game'

describe Game do

  before do
    $stdout = StringIO.new
  end

  before do
    @game = Game.new("Knuckleheads")
    @player = spy("Some player")
    @game.add_player(@player)
  end

  it "w00ts a player when they roll a high number" do
    allow_any_instance_of(Die).to receive(:roll).and_return(5)
    @game.play
    expect(@player).to have_received(:w00t)
  end

  it "skips a player when they roll a medium number" do
    allow_any_instance_of(Die).to receive(:roll).and_return(3)
    @game.play
    expect(@player).not_to have_received(:w00t)
    expect(@player).not_to have_received(:blam)
  end

  it "blams a player when they roll a low number" do
    allow_any_instance_of(Die).to receive(:roll).and_return(2)
    @game.play
    expect(@player).to have_received(:blam)
  end

end
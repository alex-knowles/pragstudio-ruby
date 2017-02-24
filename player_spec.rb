require_relative 'player'

describe Player do

  before do
    @player = Player.new("larry", 150)
  end

  it "has a capitalized name" do
    expect(@player.name).to eq("Larry")
  end

  it "has an initial health" do
    expect(@player.health).to eq(150)
  end

  it "has a string representation" do
    expect(@player.to_s).to eq("I'm Larry with a health of 150 and a score of 155.")
  end

  it "computes a score as the sum of its health and length of name" do
    expect(@player.score).to eq(150 + 5)
  end

  it "increases health by 15 when w00ted"

  it "decreases health by 10 when blammed"

end
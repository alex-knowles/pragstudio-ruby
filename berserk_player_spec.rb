require_relative 'berserk_player'

describe BerserkPlayer do

  before do
    @initial_health = 50
    @player = BerserkPlayer.new("berserker", @initial_health)
  end

  it "gets health increases from blams after 6 w00ts" do
    expect(@player.health).to eq(@initial_health)

    @player.blam
    expected_health = @initial_health - 10
    expect(@player.health).to eq(expected_health)

    6.times { @player.w00t }
    expected_health += 6 * 15
    expect(@player.health).to eq(expected_health)

    2.times { @player.blam }
    expected_health += 2 * 15
    expect(@player.health).to eq(expected_health)
  end

end
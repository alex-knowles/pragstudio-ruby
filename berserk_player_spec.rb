require_relative 'berserk_player'

module StudioGame

  describe BerserkPlayer do

    before do
      $stdout = StringIO.new
    end

    before do
      @initial_health = 50
      @player = BerserkPlayer.new("berserker", @initial_health)
    end

    it "does not go berserk when w00ted up to 5 times" do
      5.times { @player.w00t }
      expect(@player.berserk?).to be_falsey
    end

    it "goes berserk when w00ted more than 5 times" do
      6.times { @player.w00t }
      expect(@player.berserk?).to be_truthy
    end

    it "gets w00ted instead of blammed once it's gone berserk" do
      6.times { @player.w00t }
      expected_health = @initial_health + 6 * 15
      expect(@player.health).to eq(expected_health)

      @player.blam
      expected_health += 15
      expect(@player.health).to eq(expected_health)
    end

  end

end

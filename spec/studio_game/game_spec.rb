require_relative 'game'

module StudioGame

  describe Game do

    before do
      $stdout = StringIO.new
    end

    before do
      @game = Game.new("Knuckleheads")
      @player = spy("Some player")
      @game.add_player(@player)
      @rounds = 1
    end

    it "w00ts a player when they roll a high number" do
      allow_any_instance_of(Die).to receive(:roll).and_return(5)
      @game.play(@rounds)
      expect(@player).to have_received(:w00t)
    end

    it "skips a player when they roll a medium number" do
      allow_any_instance_of(Die).to receive(:roll).and_return(3)
      @game.play(@rounds)
      expect(@player).not_to have_received(:w00t)
      expect(@player).not_to have_received(:blam)
    end

    it "blams a player when they roll a low number" do
      allow_any_instance_of(Die).to receive(:roll).and_return(2)
      @game.play(@rounds)
      expect(@player).to have_received(:blam)
    end

    it "assigns a treasure for points during a player's turn" do
      @game.play(@rounds)
      expect(@player).to have_received(:found_treasure)
    end

    context "with a die that always rolls a 6" do

      before do
        allow_any_instance_of(Die).to receive(:roll).and_return(6)
        @game = Game.new("w00tfest")
        @player = spy("Player 1")
        @game.add_player(@player)
      end

      it "w00ts a player 5 times in 5 rounds" do
        rounds = 5
        @game.play(rounds)
        expect(@player).to have_received(:w00t).exactly(rounds).times
      end

    end

  end

end

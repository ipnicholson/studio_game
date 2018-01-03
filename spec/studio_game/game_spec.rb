require 'studio_game/game'

module StudioGame
  describe Game do
    before do
      @game = Game.new('Knuckleheads')
      @rounds = 2

      @initial_health = 100
      @player = Player.new("moe", @initial_health)

      @game.add_player(@player)
      $stdout = StringIO.new
    end

    it "w00ts the player when a high number is rolled" do
      allow_any_instance_of(Die).to receive(:roll).and_return(5)

      @game.play(@rounds)

      @player.health.should == @initial_health + (15 * @rounds)
    end

    it "skips the player when a medium number is rolled" do
      allow_any_instance_of(Die).to receive(:roll).and_return(3)

      @game.play(@rounds)

      @player.health.should == @initial_health

    end

    it "blams the player when a low number is rolled" do
      allow_any_instance_of(Die).to receive(:roll).and_return(1)

      @game.play(@rounds)

      @player.health.should == @initial_health - (10 * @rounds)
    end

    it "assigns a treasure for points during a player's turn" do
      @game.play(1)

      expect(@player.points).to_not be_zero
    end

    it "computes total points the sum of all player points" do
      @player2 = Player.new("larry")
      @game.add_player(@player2)

      @player.found_treasure(Treasure.new(:hammer, 50))
      @player2.found_treasure(Treasure.new(:hammer, 50))
      @player2.found_treasure(Treasure.new(:hammer, 400))

      expect(@game.total_points).to eq(500)
    end
  end
end
require_relative 'berserk_player'

module StudioGame
  describe BerserkPlayer do
    before do
      @initial_health = 50
      @berserk_player = BerserkPlayer.new("berserker", @initial_health)
      $stdout = StringIO.new
    end

    it "creates a berserk player" do
      expect(@berserk_player.class).to eq(BerserkPlayer)
    end

    it "does not go berserk when w00ted up to 5 times" do
      1.upto 5 { @berserk_player.w00t }
      
      expect(@berserk_player.berserk?).to be false
    end
    
    it "goes berserk when w00ted more than 5 times" do
      1.upto 6 { @berserk_player.w00t }
      
      expect(@berserk_player.berserk?).to be true
    end
    
    it "gets w00ted instead of blammed when it goes berserk" do
      1.upto 6 { @berserk_player.w00t }
      1.upto 2 { @berserk_player.blam }

      expect(@berserk_player.health).to eq(@initial_health + 8 * 15)
    end
  end
end
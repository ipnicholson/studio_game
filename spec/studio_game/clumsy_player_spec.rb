require 'studio_game/clumsy_player'
require_relative 'spec_helper'

module StudioGame
  describe ClumsyPlayer do
    before do
      @clumsy_player = ClumsyPlayer.new("klutz", 100)
      $stdout = StringIO.new
    end

    it "creates a clumsy player" do
      expect(@clumsy_player).to_not eq(nil)
    end
    
    it "gets only half the point values from treasure" do
      hammer = Treasure.new(:hammer, 50)
      @clumsy_player.found_treasure(hammer)
      @clumsy_player.found_treasure(hammer)
      
      expect(@clumsy_player.points).to eq(50)
      
      crowbar = Treasure.new(:crowbar, 400)
      @clumsy_player.found_treasure(crowbar)
      
      expect(@clumsy_player.points).to eq(250)
      
      yielded = []
      @clumsy_player.each_found_treasure do |treasure|
        yielded << treasure
      end
      
      expect(yielded).to eq([Treasure.new(:hammer, 50), Treasure.new(:crowbar, 200)])
    end
    
    context "with a boost factor" do
      before do
        @initial_health = 100
        @boost_factor = 2
        @boost_player = ClumsyPlayer.new("boost", @initial_health, @boost_factor)
      end
    
      it "has a boost factor" do
        expect(@boost_player.boost_factor).to eq(@boost_factor)
      end
      
      it "gets w00ted boost factor times when w00ted" do
        @boost_player.w00t
    
        expect(@boost_player.health).to eq(@initial_health + (@boost_factor * 15))
      end
    end
  end
end
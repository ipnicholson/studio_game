require 'studio_game/player'
require_relative 'spec_helper'

module StudioGame
  describe Player do # describe is an RSpec method
    before do # before is an RSpec method, this block will run before every it block
      @initial_health = 120
      @player = Player.new("moe", @initial_health)
      $stdout = StringIO.new # suppress standard output so only rest results are logged to console
    end

    it "has a capitalized name" do
      expect(@player.name).to eq("Moe")
    end

    it "has an initial health" do
      expect(@player.health).to eq(@initial_health)
    end

    it "has a string representation" do
      @player.found_treasure(Treasure.new(:hammer, 50))
      @player.found_treasure(Treasure.new(:hammer, 50))

      expect(@player.to_s).to eq("I'm Moe with health = 120, points = 100, and score = 220.")
    end

    it "computes a score as the sum of its health and points" do
      @player.found_treasure(Treasure.new(:hammer, 50))
      @player.found_treasure(Treasure.new(:hammer, 50))
      
      expect(@player.score).to eq(@initial_health + @player.points)
    end

    it "increases health by 15 when w00ted" do
      @player.w00t

      expect(@player.health).to eq(@initial_health + 15)
    end

    it "decreases health by 10 when blammed" do
      @player.blam

      expect(@player.health).to eq(@initial_health - 10)
    end

    it "computes points as the sum of all treasure points" do
      expect(@player.points).to eq(0)

      @player.found_treasure(Treasure.new(:hammer, 50))
      
      expect(@player.points).to eq(50)

      @player.found_treasure(Treasure.new(:skillet, 100))

      expect(@player.points).to eq(150)

      @player.found_treasure(Treasure.new(:crowbar, 400))

      expect(@player.points).to eq(550)
    end

    it "yields each found treasure and its total points" do
      @player.found_treasure(Treasure.new(:hammer, 50))
      @player.found_treasure(Treasure.new(:skillet, 100))
      @player.found_treasure(Treasure.new(:skillet, 100))
      @player.found_treasure(Treasure.new(:skillet, 100))
      @player.found_treasure(Treasure.new(:pie, 5))
      @player.found_treasure(Treasure.new(:pie, 5))

      yielded = []
      @player.each_found_treasure do |treasure|
        yielded << treasure
      end

      expect(yielded).to eq [
        Treasure.new(:hammer, 50),
        Treasure.new(:skillet, 300),
        Treasure.new(:pie, 10)
    ]
    end

    context "created with a default health of 100" do
      before do
        @player = Player.new("moe")
      end

      it "has a default health of 100" do
        expect(@player.health).to eq(100)
      end
    end

    context "with a health greater than 100" do
      before do
        @player = Player.new("moe", 150)
      end

      it "is strong" do
        @player.should be_strong #syntatic sugar for @player.strong?.should == true
      end
    end

    context "with health <= 100" do
      before do
        @player = Player.new("moe", 100)
      end

      it "is wimpy" do
        @player.should_not be_strong
      end
    end

    context "in a collection of players" do
      before do
        @player1 = Player.new('moe', 100)
        @player2 = Player.new('larry', 200)
        @player3 = Player.new('curly', 300)

        @players = [@player1, @player2, @player3]
      end

      it "is sorted by decreasing score" do
        @players.sort.should == [@player3, @player2, @player1]
      end
    end

    it "can be created from a CSV string" do
      player = Player.from_csv("moe,100")

      expect(player.name).to eq("Moe")
      expect(player.health).to eq(100)
    end
  end
end
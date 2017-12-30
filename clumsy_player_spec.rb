require_relative 'clumsy_player'
require_relative 'spec_helper'

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
end
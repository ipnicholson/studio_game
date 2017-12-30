require_relative 'clumsy_player'
require_relative 'spec_helper'

describe ClumsyPlayer do
  before do
    @clumsy = ClumsyPlayer.new("klutz", 100)
    $stdout = StringIO.new
  end

  it "creates a clumsy player" do
    expect(@clumsy).to_not eq(nil)
  end

  it "gets only half the point values from treasure" do
    hammer = Treasure.new(:hammer, 50)
    @clumsy.found_treasure(hammer)
    @clumsy.found_treasure(hammer)

    expect(@clumsy.points).to eq(50)

    crowbar = Treasure.new(:crowbar, 400)
    @clumsy.found_treasure(crowbar)

    expect(@clumsy.points).to eq(250)

    yielded = []
    @clumsy.each_found_treasure do |treasure|
      yielded << treasure
    end

    expect(yielded).to eq([Treasure.new(:hammer, 50), Treasure.new(:crowbar, 200)])
  end
end
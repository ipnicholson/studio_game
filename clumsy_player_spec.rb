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

  # it "gets only half the point values from treasure" do

  # end
end
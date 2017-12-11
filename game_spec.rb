require_relative 'game'

describe Game do

  before do
    @game = Game.new('Knuckleheads')

    @initial_health = 100
    @player = Player.new("moe", @initial_health)

    @game.add_player(@player)
    $stdout = StringIO.new
  end

  it "w00ts the player when a high number is rolled" do
    allow_any_instance_of(Die).to receive(:roll).and_return(5)

    @game.play

    @player.health.should == @initial_health + 15
  end

  it "skips the player when a medium number is rolled" do
    allow_any_instance_of(Die).to receive(:roll).and_return(3)

    @game.play

    @player.health.should == @initial_health

  end

  it "blams the player when a low number is rolled" do
    allow_any_instance_of(Die).to receive(:roll).and_return(1)

    @game.play

    @player.health.should == @initial_health - 10
  end

end

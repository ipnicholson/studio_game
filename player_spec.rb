require_relative 'player'



describe Player do # describe is an RSpec method

  before do # before is an RSpec method, this block will run before every it block
    @initial_health = 120
    @player = Player.new("moe", @initial_health)
    $stdout = StringIO.new
  end

  it "has a capitalized name" do
    expect(@player.name).to eq("Moe")
  end

  it "has an initial health" do
    expect(@player.health).to eq(@initial_health)
  end

  it "has a string representation" do
    expect(@player.to_s).to eq("I'm Moe with a health of 120 and a score of 123.")
  end

  it "computes a score as the sum of its health and length of name" do
    expect(@player.score).to eq(@initial_health + @player.name.length)
  end

  it "increases health by 15 when w00ted" do
    @player.w00t

    expect(@player.health).to eq(@initial_health + 15)
  end

  it "decreases health by 10 when blammed" do
    @player.blam

    expect(@player.health).to eq(@initial_health - 10)
  end

  context "created with a default health of 100" do
    before do
      @player = Player.new("moe")
    end

    it "has an default health of 100" do
      expect(@player.health).to eq(100)
    end

  end

end
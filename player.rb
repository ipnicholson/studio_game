class Player
  def initialize(name, health=100)
    @name = name.capitalize
    @health = health
  end

  attr_accessor :name
  attr_reader :health

  def to_s
    "I'm #{@name} with a health of #{@health} and a score of #{score}."
  end

  def score
    @name.length + @health
  end

  def blam
    @health -= 10
    puts "#{@name} got blammed!"
  end

  def w00t
    @health += 15
    puts "#{@name} got w00ted!"
  end

  def name=(new_name)
    @name = new_name.capitalize
  end

  if __FILE__ == $0 # only run this if this file is directly executed
    player1 = Player.new('moe')
    player2 = Player.new('larry', 60)
    player3 = Player.new('curly', 125)

    puts player1
    puts player2
    puts player3
  end
end
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

  def strong?
    @health > 100
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
    player = Player.new("moe")
    puts player.name
    puts player.health
    player.w00t
    puts player.health
    player.blam
    puts player.health    
  end
  
end
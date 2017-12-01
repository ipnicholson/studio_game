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

end

class Game
  def initialize(title)
    @title = title
    @players = []
  end

  attr_reader :title

  def add_player(player)
    @players << player
  end

  def play
    puts "There are #{@players.size} players in #{@title}"
    @players.each do |player|
      puts player
    end

    @players.each do |player|
      player.blam
      player.w00t
      player.w00t
      puts player
    end
  end

end

knuckleheads = Game.new("Knuckleheads")

player1 = Player.new('moe')
player2 = Player.new('larry', 60)
player3 = Player.new('curly', 125)

knuckleheads.add_player(player1)
knuckleheads.add_player(player2)
knuckleheads.add_player(player3)

knuckleheads.play

ninja_turtles = Game.new("Ninja Turtles")

player11 = Player.new('Donatello')
player12 = Player.new('Raphael', 140)
player13 = Player.new('Michelangelo', 160)

ninja_turtles.add_player(player11)
ninja_turtles.add_player(player11)
ninja_turtles.add_player(player11)

ninja_turtles.play

# players.each do |player|
#   puts player.health
# end
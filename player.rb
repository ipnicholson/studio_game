require_relative 'playable'
require_relative 'treasure_trove'

class Player
  include Playable

  attr_accessor :name
  attr_accessor :health
  
  def initialize(name, health=100)
    @name = name.capitalize
    @health = health
    @found_treasures = Hash.new(0)
  end

  def to_s
    "I'm #{@name} with health = #{@health}, points = #{points}, and score = #{score}."
  end

  def <=>(other_player)
    other_player.score <=> score
  end

  def score
    @health + points
  end

  def name=(new_name)
    @name = new_name.capitalize
  end

  def self.from_csv(string) # takes string formatted as CSV, returns a Player object
    name, health = string.split(',')
    player = Player.new(name, Integer(health))
  end

  def found_treasure(treasure) #takes a treasure object
    @found_treasures[treasure.name] += treasure.points
    puts "#{@name} found a #{treasure.name} worth #{treasure.points} points"
    puts "#{@name}'s treasures: #{@found_treasures}"
  end

  def each_found_treasure
    @found_treasures.each do |name, points|
      yield Treasure.new(name, points)
    end
  end

  def points # returns sum of player's treasure points
    @found_treasures.values.reduce(0, :+)
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
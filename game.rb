require_relative 'player'
require_relative 'game_turn'

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
      GameTurn.take_turn(player)
    end
  end
end
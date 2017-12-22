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

  def play(rounds)
    puts "There are #{@players.size} players in #{@title}"
    
    @players.each do |player|
      puts player
    end

    1.upto(rounds) do |number|
      puts "\nRound #{number}:"
      @players.each do |player|
        GameTurn.take_turn(player)
      end
    end

  end

end
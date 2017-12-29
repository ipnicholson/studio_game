require_relative 'player'

class ClumsyPlayer < Player
  # def initialize
  #   super(name, health)
  
  # end
  
  # treasure are worth half their point value

  if __FILE__ == $0
    clumsy = ClumsyPlayer.new('klutz', 100)

    hammer = Treasure.new(:hammer, 50)
    clumsy.found_treasure(hammer)
    clumsy.found_treasure(hammer)
    clumsy.found_treasure(hammer)

    crowbar = Treasure.new(:crowbar, 400)
    clumsy.found_treasure(crowbar)

    clumsy.each_found_treasure do |treasure|
      puts "#{treasure.points} total #{treasure.name} points"
    end
    puts "#{clumsy.points} grand total points"
  end
end


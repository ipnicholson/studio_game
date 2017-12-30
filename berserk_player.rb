require_relative 'player'

class BerserkPlayer < Player

  def initialize(name, health)
    super(name, health)
    @w00t_count=0
    @berserk = false
  end

  def w00t
    @w00t_count += 1
    if @w00t_count == 6
      @berserk = true 
    end
    super
  end

  def blam
    if @berserk
      puts "#{@name} was blammed, but they're berserk! So..."
      w00t
    elsif
      blam
    end
    
  end

  if __FILE__ == $0
    berserker = BerserkPlayer.new("berserker", 50)
    6.times {berserker.w00t}
    2.times {berserker.blam}
    puts berserker.health
  end
end
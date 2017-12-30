require_relative 'game' # game requires player.rb, so that dependency is included, too
require_relative 'clumsy_player'

knuckleheads = Game.new("Knuckleheads")

knuckleheads.load_players(ARGV.shift || 'players.csv')

klutz = ClumsyPlayer.new("klutz", 105)

knuckleheads.add_player(klutz)

loop do
  puts "\nHow many game rounds? ('quit' to exit)"
  answer = gets.chomp.downcase
  case answer
  when /^\d+$/
    knuckleheads.play(answer.to_i)
  when 'quit', 'exit'
    knuckleheads.print_stats
    break
  else
    puts "Please enter a number or 'quit'"
  end
end

knuckleheads.save_high_scores
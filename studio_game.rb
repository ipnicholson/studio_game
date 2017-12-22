require_relative 'game' # game requires player.rb, so that dependency is included, too

knuckleheads = Game.new("Knuckleheads")

player1 = Player.new('moe')
player2 = Player.new('larry', 60)
player3 = Player.new('curly', 125)

knuckleheads.add_player(player1)
knuckleheads.add_player(player2)
knuckleheads.add_player(player3)

knuckleheads.play(3)
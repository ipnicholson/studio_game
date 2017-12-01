require_relative 'game' # game requires player.rb, so that dependency is included, too

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
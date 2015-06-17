require_relative './game_controller.rb'
require_relative './console_ui'
require_relative './guessing_game.rb'

game = GuessingGame.new(range: (1..100), chances: 6)
game_controller = GameController.new(game: game, ui: ConsoleUI.new)
game_controller.play_game

require_relative './game_controller.rb'
require_relative './console_ui'
require_relative './guessing_game.rb'

game_controller = GameController.new(game: GuessingGame.new(1, 100), ui: ConsoleUI.new)
game_controller.play_game
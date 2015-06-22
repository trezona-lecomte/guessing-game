require_relative './game_controller.rb'
require_relative './console_ui.rb'
require_relative './guessing_game.rb'

range = nil

until range
  puts 'Please enter what you would like to play with:
          a) numbers
          b) letters'

  choice = gets.chomp

  if choice == 'numbers' || choice == 'a'
    range = (1..100)
  elsif choice == 'letters' || choice == 'b'
    range = ('a'..'z')
  end
end

game = GuessingGame.new(range: range, chances: 6)
game_controller = GameController.new(game: game, ui: ConsoleUI.new)
game_controller.play_game

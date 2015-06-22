require_relative './guessing_game.rb'
require_relative './console_ui.rb'
require_relative './guess.rb'
require_relative './build_guess.rb'

class GameController
  def initialize(game:, ui: ConsoleUI.new)
    @game = game
    @range = @game.range
    @ui = ui
  end

  def play_game
    welcome_user

    until @game.won? || @game.lost?
      guess = nil

      until guess
        guess = BuildGuess.call(range: @range, guess_str: guess_str_from_user)
      end

      @game.try_guess(guess)

      @ui.display_guess_result(guess: guess)

      @ui.display_chances_left(@game.chances_left)
    end

    report_game_result
  end

  def welcome_user
    @ui.display_welcome_message
  end

  def guess_str_from_user
    @ui.get_guess_str(@range.first, @range.last)
  end

  def report_game_result
    if @game.won?
      @ui.display_game_won_message
      @ui.display_unicorn
    elsif @game.lost?
      @ui.display_game_lost_message(magic_element: @game.reveal_magic_element)
    end
  end
end

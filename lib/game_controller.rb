require_relative './guessing_game.rb'
require_relative './console_ui.rb'
require_relative './guess.rb'

class GameController
  def initialize(game:, ui: ConsoleUI.new)
    @game = game
    @ui = ui
  end

  # TODO How do I test the play_game method?
  def play_game
    welcome_user

    until @game.won? || @game.lost?
      user_guess = Guess.new

      until user_guess.valid
        user_guess.build(range: @game.range, guess_str: guess_str_from_user)
      end

      @game.try_guess(guess: user_guess)

      @ui.display_guess_result(guess: user_guess)
    end

    report_game_result
  end

  private
    def welcome_user
      @ui.display_welcome_message
    end

    def guess_str_from_user
      @ui.get_guess_str(range: @game.range)
    end

    def report_game_result
      if @game.won?
        @ui.display_game_won_message
      elsif @game.lost?
        @ui.display_game_lost_message(magic_element: @game.reveal_magic_element)
      end
    end
end

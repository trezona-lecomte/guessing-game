require_relative 'build_guess'
require_relative 'console_ui'
require_relative 'guess'
require_relative 'guessing_game'

class GameController
  def initialize(game:, ui:)
    @game = game
    @range = @game.range
    @ui = ui
  end

  def play_game
    welcome_user

    until @game.won? || @game.lost?
      guess = nil

      until guess
        guess = new_guess
      end

      @game.try_guess(guess)

      @ui.display_guess_result(guess.result)

      @ui.display_chances_left(@game.chances_left)
    end

    report_game_result
  end

  private
    def welcome_user
      @ui.display_welcome_message
    end

    def new_guess
      BuildGuess.call(range: @range, guess_str: @ui.get_guess_str(@range.first, @range.last))
    end

    def report_game_result
      if @game.won?
        @ui.display_game_won_message
        @ui.display_unicorn
      elsif @game.lost?
        @ui.display_game_lost_message(hidden_value: @game.reveal_hidden_value)
      end
    end
end

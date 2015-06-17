require_relative './guessing_game.rb'
require_relative './console_ui.rb'

class GameController
  def initialize(game:, ui: ConsoleUI.new)
    @game = game
    @ui = ui
  end

  # TODO How do I test the play_game method?
  def play_game
    welcome_user

    until @game.won? || @game.lost?
      @guess = guess_from_user

      @game.make_guess(@guess)

      report_guess_result
    end

    report_game_result
  end

  def welcome_user
    @ui.display_welcome_message
  end

  def guess_from_user
    @ui.get_guess(@game.lower_bound, @game.upper_bound)
  end

  def report_guess_result
    @ui.display_guess_result(@game.last_guess_result)
  end

  def report_game_result
    if @game.won?
      @ui.display_game_won_message
    elsif @game.lost?
      @ui.display_game_lost_message(@game.reveal_magic_number)
    end
  end
end
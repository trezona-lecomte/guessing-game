require_relative './guessing_game.rb'
require_relative './console_ui.rb'

class GameController
	def initialize(game: game, ui: ConsoleUI.new)
		@game = game
		@ui = ui
	end

	def play_game
		welcome_user

		until @game.won? || @game.lost?
			@guess = get_guess_from_user

			@game.make_guess(@guess)

			report_game_status
		end
	end

	def welcome_user
		@ui.display_welcome_message
	end

	def get_guess_from_user
		@ui.get_guess(@game.lower_bound, @game.upper_bound)
	end

	# def report_game_status
	# 	@ui.display_too_high_message(@guess) if @game.guess_too_high?
	# 	@ui.display_too_low_message(@guess)  if @game.guess_too_low?
	# 	if @game.won?
	# 		@ui.display_game_won_message
	# 		@ui.display_unicorn
	# 	elsif	@game.lost?
	# 		@ui.display_game_lost_message(@game.reveal_magic_number)
	# 	end
	# end
end
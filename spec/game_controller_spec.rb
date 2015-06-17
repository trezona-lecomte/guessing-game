require 'spec_helper'
require 'game_controller'
require 'byebug'

RSpec.describe GameController, :type => :controller do
	let(:game) 			 { GuessingGame.new }
	let(:ui)	 			 { ConsoleUI.new }
	let(:controller) { GameController.new(game: game, ui: ui) }

	describe '#initialize' do
		it 'accepts a game and a UI' do
			controller = GameController.new(game: game, ui: ui)
			expect(controller.instance_variable_get(:@ui)).to eq(ui)
			expect(controller.instance_variable_get(:@game)).to eq(game)
		end

		it 'provides a ConsoleUI by default' do
			controller = GameController.new(game: game)
			expect(controller.instance_variable_get(:@ui)).to be_a(ConsoleUI)
		end
	end

  describe '#welcome_user' do
    context 'when __context__' do
      it 'tells the UI to display a welcome message' do
        expect(ui).to receive(:display_welcome_message)
        controller.welcome_user
      end
    end
  end

  describe '#get_guess_from_user' do
    context 'when there is a valid game and ui' do
      it 'gets a guess from the ui' do
      	allow(ui).to receive(:get_guess).and_return(99)
      	expect(controller.get_guess_from_user).to eq(99)
      end
    end
  end

  describe '#report_guess_result' do
		it 'tells the UI to display the guess result' do
      expect(ui).to receive(:display_guess_result)
      controller.report_guess_result
    end
  end

  describe '#report_game_result' do
  	context 'when the game is won' do
			it 'tells the UI to display the game won message' do
				allow(game).to receive(:won?).and_return(true)
	      expect(ui).to receive(:display_game_won_message)
	      controller.report_game_result
	    end
	  end

	  context 'when the game is lost' do
			it 'tells the UI to display the game lost message' do
				allow(game).to receive(:lost?).and_return(true)
	      expect(ui).to receive(:display_game_lost_message)
	      controller.report_game_result
	    end
	  end
  end
end
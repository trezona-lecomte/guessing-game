require 'spec_helper'
require 'game_controller'
require 'byebug'

RSpec.describe GameController, :type => :controller do
  let(:game)       { GuessingGame.new }
  let(:ui)         { ConsoleUI.new }
  let(:controller) { GameController.new(game: game, ui: ui) }

  describe '#welcome_user' do
    context 'when __context__' do
      it 'tells the UI to display a welcome message' do
        expect(ui).to receive(:display_welcome_message)
        controller.welcome_user
      end
    end
  end

  describe '#guess_str_from_user' do
    it 'gets a guess from the ui' do
      allow(ui).to receive(:get_guess_str).and_return('99')

      expect(controller.guess_str_from_user).to eq('99')
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
      it 'tells the UI to display the game lost message with answer' do
        allow(game).to receive(:lost?).and_return(true)

        expect(ui).to receive(:display_game_lost_message).with(magic_element: game.reveal_magic_element)

        controller.report_game_result
      end
    end
  end
end

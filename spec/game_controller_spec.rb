require "spec_helper"
require "game_controller"
require "byebug"

RSpec.describe GameController, :type => :controller do
  let(:game)       { GuessingGame.new }
  let(:ui)         { ConsoleUI.new }
  let(:controller) { GameController.new(game: game, ui: ui) }

  # TODO there must be nicer way to do this...
  describe "#play_game" do
    context "when the game is lost" do
      it "ends the game" do
        allow(ui).to receive(:user_guess).and_return("1")

        expect(ui).to receive(:display_welcome_message).once

        allow(game).to receive(:won?).and_return  false, false
        allow(game).to receive(:lost?).and_return false, true

        expect(ui).to receive(:display_game_lost_message)

        controller.play_game
      end
    end

    context "when the game is won" do
      it "ends the game" do
        allow(ui).to receive(:user_guess).and_return("1")

        expect(ui).to receive(:display_welcome_message).once

        allow(game).to receive(:won?).and_return  false, true
        allow(game).to receive(:lost?).and_return false, false

        expect(ui).to receive(:display_game_won_message)

        controller.play_game
      end
    end
  end
end

require "spec_helper"
require "guessing_game"
require "guess"
require "build_guess"

RSpec.describe GuessingGame do
  let(:range) { (1..100) }
  let(:guess) { BuildGuess.call(range: range, user_input: "1") }
  let(:game)  { GuessingGame.new(range: range) }

  describe "#try_guess" do
    before { allow(guess).to receive(:value).and_return(value) }

    context "when a valid guess is made" do
      context "with a guess of the lower bound" do
        let(:value) { range.first }

        it "expends a chance" do
          expect{game.try_guess(guess)}.to change{game.chances_left}.from(6).to(5)
        end
      end

      context "with a guess of the upper bound" do
        let(:value) { range.last }

        it "expends a chance" do
          expect{game.try_guess(guess)}.to change{game.chances_left}.from(6).to(5)
        end
      end

      context "with a random guess" do
        let(:value) { rand(range) }

        it "expends a chance" do
          expect{game.try_guess(guess)}.to change{game.chances_left}.from(6).to(5)
        end
      end
    end

    context "when an invalid guess is made" do
      context "with a guess of the lower bound - 1" do
        let(:value) { range.first - 1 }

        it "doesn't expend a chance" do
          expect{game.try_guess(guess)}.to_not change{game.chances_left}
        end
      end

      context "with a guess of the upper bound + 1" do
        let(:value) { range.last + 1 }

        it "doesn't expend a chance" do
          expect{game.try_guess(guess)}.to_not change{game.chances_left}
        end
      end
    end
  end

  describe "#won?" do
    context "when no guesses have been made" do
      it "returns false" do
        expect(game).to_not be_won
      end
    end

    context "when at least 1 guess has been made" do
      before do
        allow(guess).to receive(:correct?).and_return(correct)
        game.guesses.push(guess)
      end

      context "when a guess is correct" do
        let(:correct) { true }

        it { expect(game).to be_won }
      end

      context "when no guesses are correct" do
        let(:correct) { false }

        it { expect(game).to_not be_won }
      end
    end
  end

  describe "#lost?" do
    before { allow(game).to receive(:won?).and_return(won) }

    context "when no chances are left" do
      before { game.instance_variable_set("@chances_left", 0) }

      context "when game is not won" do
        let(:won) { false }

        it { expect(game).to be_lost }
      end

      context "when game is won" do
        let(:won) { true }

        it { expect(game).to_not be_lost }
      end
    end

    context "when there are chances left" do
      before { game.instance_variable_set("@chances_left", 1) }

      context "when the game is not won" do
        let(:won) { false }

        it { expect(game).to_not be_lost }
      end

      context "when the game is won" do
        let(:won) { true }

        it { expect(game).to_not be_lost }
      end
    end
  end

  describe "#reveal_hidden_value" do
    context "when the game is won" do
      before { allow(game).to receive(:won?).and_return(true) }

      it "returns the magic element" do
        expect(game.reveal_hidden_value).to_not be_nil
      end
    end

    context "when the game is lost" do
      before { allow(game).to receive(:lost?).and_return(true) }

      it "returns the magic element" do
        expect(game.reveal_hidden_value).to_not be_nil
      end
    end

    context "when the game is not won or lost" do
      it "returns nil" do
        expect(game.reveal_hidden_value).to be_nil
      end
    end
  end
end

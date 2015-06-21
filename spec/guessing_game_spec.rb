require 'spec_helper'
require 'guessing_game'
require 'guess'
require 'build_guess'

RSpec.describe GuessingGame do
  let(:range) { (1..100) }
  let(:guess) { BuildGuess.call(range: range, guess_str: "1") }
  let(:game)  { GuessingGame.new(range: range) }

  describe '#try_guess' do
    before { allow(guess).to receive(:value).and_return(value) }

    context 'when a valid guess is made' do
      context 'with a guess of the lower bound' do
        let(:value) { range.first }
        it 'expends a chance' do
          expect{game.try_guess(guess)}.to change{game.chances_left}.from(6).to(5)
        end
      end

      context 'with a guess of the upper bound' do
        let(:value) { range.last }
        it 'expends a chance' do
          expect{game.try_guess(guess)}.to change{game.chances_left}.from(6).to(5)
        end
      end

      context 'with a random guess' do
        let(:value) { rand(range) }
        it 'expends a chance' do
          expect{game.try_guess(guess)}.to change{game.chances_left}.from(6).to(5)
        end
      end
    end

    context 'when an invalid guess is made' do
      context 'with a guess of the lower bound - 1' do
        let(:value) { range.first - 1 }
        it "doesn't expend a chance" do
          expect{game.try_guess(guess)}.to_not change{game.chances_left}
        end
      end

      context 'with a guess of the upper bound + 1' do
        let(:value) { range.last + 1 }
        it "doesn't expend a chance" do
          expect{game.try_guess(guess)}.to_not change{game.chances_left}
        end
      end
    end
  end

  describe '#won?' do
    context 'when no guesses have been made' do
      it 'returns false' do
        expect(game.won?).to eq(false)
      end
    end

    context 'when at least 1 guess has been made' do
      before do
        allow(guess).to receive(:correct?).and_return(correct)
      end

      context 'when a guess is correct' do
        let(:correct) { true }
        it 'returns true' do
          game.guesses.push(guess)
          expect(game.won?).to eq(true)
        end
      end

      context 'when no guesses are correct' do
        let(:correct) { false }
        it 'returns false' do
          game.guesses.push(guess)
          expect(game.won?).to eq(false)
        end
      end
    end
  end

  describe '#lost?' do
    before { allow(game).to receive(:won?).and_return(won) }

    context 'when no chances are left' do
      before { game.instance_variable_set('@chances_left', 0) }

      context 'when game is not won' do
        let(:won) { false }

        it 'returns true' do
          expect(game.lost?).to eq(true)
        end
      end

      context 'when game is won' do
        let(:won) { true }

        it 'returns false' do
          expect(game.lost?).to eq(false)
        end
      end
    end

    context 'when there are chances left' do
      before { game.instance_variable_set('@chances_left', 1) }

      context 'when the game is not won' do
        let(:won) { false }

        it 'returns false' do
          expect(game.lost?).to eq(false)
        end
      end

      context 'when the game is won' do
        let(:won) { true }

        it 'returns false' do
          expect(game.lost?).to eq(false)
        end
      end
    end
  end

  describe '#reveal_magic_element' do
    context 'when the game is won' do
      it 'returns the magic element' do
        allow(game).to receive(:won?).and_return(true)

        expect(game.reveal_magic_element).to_not be_nil
      end
    end

    context 'when the game is lost' do
      it 'returns the magic element' do
        allow(game).to receive(:lost?).and_return(true)

        expect(game.reveal_magic_element).to_not be_nil
      end
    end

    context 'when the game is not won or lost' do
      it 'returns nil' do
        expect(game.reveal_magic_element).to be_nil
      end
    end
  end
end

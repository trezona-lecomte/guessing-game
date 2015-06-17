require 'spec_helper'
require 'guessing_game'

RSpec.describe GuessingGame do
  let(:range) { (1..100) }
  let(:game) { GuessingGame.new(range: range) }

  describe '#make_guess' do
    context 'when a valid guess is made' do
      context 'with a guess of the lower bound' do
        it 'expends a chance' do
          expect{game.make_guess(range.first)}.to change{game.chances_left}.from(6).to(5)
        end
      end

      context 'with a guess of the upper bound' do
        it 'expends a chance' do
          expect{game.make_guess(range.last)}.to change{game.chances_left}.from(6).to(5)
        end
      end

      context 'with a random guess' do
        it 'expends a chance' do
          expect{game.make_guess(rand(range.first..range.last))}.to change{game.chances_left}.from(6).to(5)
        end
      end
    end

    context 'when an invalid guess is made' do
      context 'with a guess of the lower bound - 1' do
        it "doesn't expend a chance" do
          expect{game.make_guess(range.first - 1)}.to_not change{game.chances_left}
        end
      end

      context 'with a guess of the upper bound + 1' do
        it "doesn't expend a chance" do
          expect{game.make_guess(range.last + 1)}.to_not change{game.chances_left}
        end
      end
    end
  end

  describe '#last_guess_result' do
    before do
      game.instance_variable_set("@magic_element", range.last - 1)
      game.make_guess(guess)
    end

    context 'when the guess was too high' do
      let(:guess) { range.last }

      it "returns 'too high'" do
        expect(game.last_guess_result).to eq('too high')
      end
    end

    context 'when the guess was too low' do
      let(:guess) { range.last - 2 }

      it "returns 'too low'" do
        expect(game.last_guess_result).to eq('too low')
      end
    end

    context 'when the guess was correct' do
      let(:guess) { range.last - 1 }

      it "returns 'correct'" do
        expect(game.last_guess_result).to eq('correct')
      end
    end
  end

  describe '#game_won?' do
    let(:game) { GuessingGame.new(range: (1..1)) }
    before     { game.make_guess(guess) }
    subject    { game.won? }

    context 'when last guess is correct' do
      let(:guess) { 1 }
      it { is_expected.to be true }
    end

    context 'when last guess is incorrect' do
      let(:guess) { 2 }
      it { is_expected.to be false }
    end
  end

  describe '#game_lost?' do
    subject { game.lost? }

    context 'when no chances are left' do
      before { 6.times { game.make_guess(1) } }
        it { is_expected.to be true }
    end

    context 'when there are chances left' do
        it { is_expected.to be false }
    end
  end
end

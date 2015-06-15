require 'spec_helper'
require 'guessing_game'

RSpec.describe GuessingGame do
	let(:lower_bound) { 1 }
	let(:upper_bound) { 100 }
	let(:game) { GuessingGame.new(lower_bound, upper_bound) }

	describe '#initialize' do
		it 'accepts valid upper and lower bounds' do
			expect(game).to be_a(GuessingGame)
		end
		# TODO add negative tests
	end

	describe '#valid_guess?' do
		context 'with a random valid guess' do
			it 'returns true' do
				expect(game.valid_guess?(rand(lower_bound..upper_bound))).to be true
			end
		end
		context 'with a guess of the lower bound' do
			it 'returns true' do
				expect(game.valid_guess?(lower_bound)).to be true
			end
		end
		context 'with a guess of the lower bound - 1' do
			it 'returns false' do
				expect(game.valid_guess?(lower_bound - 1)).to be false
			end
		end
		context 'with a guess of the upper bound' do
			it 'returns true' do
				expect(game.valid_guess?(upper_bound)).to be true
			end
		end
		context 'with a guess of the upper bound + 1' do
			it 'returns false' do
				expect(game.valid_guess?(upper_bound + 1)).to be false
			end
		end
	end

	describe '#guess_too_high?' do
		context 'when the guess is too high' do
			it 'returns true' do
				expect(game.guess_too_high?(upper_bound + 1)).to be true
			end
		end
		context 'when the guess is not too high' do
			it 'returns false' do
				expect(game.guess_too_high?(lower_bound - 1)).to be false
			end
		end
	end

	describe '#guess_too_low?' do
		context 'when the guess is too low' do
			it 'returns true' do
				expect(game.guess_too_low?(lower_bound - 1)).to be true
			end
		end
		context 'when the guess is not too low' do
			it 'returns false' do
				expect(game.guess_too_low?(upper_bound + 1)).to be false
			end
		end
	end
end

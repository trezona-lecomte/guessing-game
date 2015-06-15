require 'spec_helper'
require 'guessing_game'

RSpec.describe GuessingGame do
	let(:game) { GuessingGame.new(1, 100) }

	describe '#initialize' do
		it 'accepts valid upper and lower bounds' do
			expect(game).to be_a(GuessingGame)
		end
		# TODO add negative tests
	end

	describe '#valid_guess?' do
		context 'with a random valid guess' do
			it 'returns true' do
				expect(game.valid_guess?(rand(1..100))).to be true
			end
		end
		context 'with a guess of the upper bound' do
			it 'returns true' do
				expect(game.valid_guess?(100)).to be true
			end
		end
		context 'with a guess of the lower bound' do
			it 'returns true' do
				expect(game.valid_guess?(1)).to be true
			end
		end
		context 'with a guess of the upper bound + 1' do
			it 'returns false' do
				expect(game.valid_guess?(101)).to be false
			end
		end
		context 'with a guess of the upper bound - 1' do
			it 'returns false' do
				expect(game.valid_guess?(0)).to be false
			end
		end
	end
end

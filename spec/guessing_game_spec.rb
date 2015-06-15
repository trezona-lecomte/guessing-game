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

	describe '#make_guess' do
  context 'when a valid guess is made' do
    it 'expends a chance' do
      expect{game.make_guess(lower_bound)}.to change{game.chances_left}.from(6).to(5)
    end
    it 'sets the last guess made' do
    	game.make_guess(lower_bound)
    	expect(game.last_guess).to eq(lower_bound)
    end
  end
  context 'when an invalid guess is made' do
  	it "doesn't expend a chance" do
  		expect{game.make_guess(lower_bound - 1)}.to_not change{game.chances_left}
  	end
  	it 'sets the last guess made' do
  		game.make_guess(lower_bound - 1)
  		expect(game.last_guess).to eq(lower_bound - 1)
  	end
  end
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

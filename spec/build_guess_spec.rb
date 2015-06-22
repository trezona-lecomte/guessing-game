require 'spec_helper'
require 'build_guess'
require 'guess'

RSpec.describe BuildGuess do

  describe '#call' do
    context' when passed a valid guess_str' do
      it 'returns a guess' do
        expect(BuildGuess.call(range: (1..100), guess_str:     "1").value).to eq(Guess.new(1).value)
        expect(BuildGuess.call(range: (1..100), guess_str: " 100 ").value).to eq(Guess.new(100).value)
      end
    end

    context' when passed an out-of-range guess_str' do
      it 'returns nil' do
        expect(BuildGuess.call(range: (1..100), guess_str:  "-1")).to eq(nil)
        expect(BuildGuess.call(range: (1..100), guess_str:   "0")).to eq(nil)
        expect(BuildGuess.call(range: (1..100), guess_str: "101")).to eq(nil)
      end
    end

    context' when passed an invalid guess_str' do
      it 'returns nil' do
        expect(BuildGuess.call(range: (1..100), guess_str: "k")).to eq(nil)
      end
      it 'returns nil' do
        expect(BuildGuess.call(range: (1..100), guess_str: "lsadjf;")).to eq(nil)
      end
    end
  end
end

require 'guess'

RSpec.describe Guess do
  let (:guess) { Guess.new(1) }

  describe '#set_result' do
    context 'when the guess is valid' do
      context 'when the guess is too high' do
        it 'sets the result to "too high"' do
          guess.compare_to(other_value: 0)
          expect(guess.result).to eq('too high')
        end
      end

      context 'when the guess is too low' do
        it 'sets the result to "too low"' do
          guess.compare_to(other_value: 2)
          expect(guess.result).to eq('too low')
        end
      end

      context 'when the guess is correct' do
        it 'sets the result to "correct"' do
          guess.compare_to(other_value: 1)
          expect(guess.result).to eq('correct')
        end
      end
    end

    context 'when the guess is invalid' do
      it 'sets the result to "invalid"' do
        guess.compare_to(other_value: '1')
        expect(guess.result).to eq('invalid')
      end
    end
  end
end

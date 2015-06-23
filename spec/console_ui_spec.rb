require 'spec_helper'
require 'console_ui'
require 'guess'

RSpec.describe ConsoleUI do
  let(:range) { (1..100) }
  let(:guess) { instance_double(Guess) }
  let(:ui)    { ConsoleUI.new }

  describe '#display_welcome_message' do
    it 'welcomes the user' do
      expect{ui.display_welcome_message}.to output("Welcome to the magical guessing game!\n").to_stdout
    end
  end

  describe '#user_guess' do
    context 'before getting the guess' do
      it 'prompts the user for their guess' do
        allow(STDIN).to receive(:gets) { "99" }
        expect{ui.user_guess(range.first, range.last)}.to output("Please enter a guess between #{range.first} and #{range.last}\n").to_stdout
      end
    end

    context 'when given a number' do
      it 'returns a string containing the number' do
        allow(STDIN).to receive(:gets) { "99\n" }
        expect(ui.user_guess(range.first, range.last)).to eq("99")
      end
    end

    context 'when given a character' do
      it 'returns a string containing the character' do
        allow(STDIN).to receive(:gets) { "a\n" }
        expect(ui.user_guess(range.first, range.last)).to eq('a')
      end
    end

    context 'when given a blank line' do
      it 'returns a blank string' do
        allow(STDIN).to receive(:gets) { "\n" }
        expect(ui.user_guess(range.first, range.last)).to eq("")
      end
    end
  end

  describe '#display_guess_result' do
    context 'when the guess was too high' do
      it 'displays the too high message' do
        allow(guess).to receive(:result).and_return('too high')
        expect{ui.display_guess_result(guess.result)}.to output("\nYour guess was too high!\n").to_stdout
      end
    end

    context 'when the guess was too low' do
      it 'displays the too low message' do
        allow(guess).to receive(:result).and_return('too low')
        expect{ui.display_guess_result(guess.result)}.to output("\nYour guess was too low!\n").to_stdout
      end
    end

    context 'when the guess was correct' do
      it 'displays the correct message' do
        allow(guess).to receive(:result).and_return('correct')
        expect{ui.display_guess_result(guess.result)}.to output("\nYour guess was correct!\n").to_stdout
      end
    end
  end

  describe '#display_chances_left' do
    it 'displays the chances left' do
      expect{ui.display_chances_left(5)}.to output("You have 5 chances left.\n\n").to_stdout
      expect{ui.display_chances_left(99)}.to output("You have 99 chances left.\n\n").to_stdout
    end
  end

  describe '#display_game_lost_message' do
    let(:value) { 99 }
    it "tells the user they've lost the game" do
      expect{ui.display_game_lost_message(hidden_value: value)}.to output("\nOh no! You've run out of chances, so you lose. You were trying to guess: #{value}.\n").to_stdout
    end
  end
end

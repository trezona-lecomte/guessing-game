require 'spec_helper'
require 'console_ui'
require 'guess'

RSpec.describe ConsoleUI do
  let(:range) { (1..100) }
  let(:guess) { instance_double(Guess) }
  let(:ui)    { ConsoleUI.new }

  describe '#display_welcome_message' do
    it 'welcomes the user' do
      expect{ui.display_welcome_message}.to output("Welcome to the magical number guessing game!\n").to_stdout
    end
  end

  describe '#get_guess_str' do
    context 'before getting the guess' do
      it 'prompts the user for their guess' do
        allow(STDIN).to receive(:gets) { "99" }
        expect{ui.get_guess_str(range: range)}.to output("Please enter a number between #{range.first} and #{range.last}\n").to_stdout
      end
    end

    context 'when given a number' do
      it 'returns a string containing the number' do
        allow(STDIN).to receive(:gets) { "99\n" }
        expect(ui.get_guess_str(range: range)).to eq("99")
      end
    end

    context 'when given a character' do
      it 'returns a string containing the character' do
        allow(STDIN).to receive(:gets) { "a\n" }
        expect(ui.get_guess_str(range: range)).to eq('a')
      end
    end

    context 'when given a blank line' do
      it 'returns a blank string' do
        allow(STDIN).to receive(:gets) { "\n" }
        expect(ui.get_guess_str(range: range)).to eq("")
      end
    end
  end

  describe '#display_guess_result' do
    context 'when the guess was too high' do
      it 'displays the too high message' do
        allow(guess).to receive(:result).and_return('too high')
        expect{ui.display_guess_result(guess: guess)}.to output("\nYour guess was too high!\n").to_stdout
      end
    end

    context 'when the guess was too low' do
      it 'displays the too low message' do
        allow(guess).to receive(:result).and_return('too low')
        expect{ui.display_guess_result(guess: guess)}.to output("\nYour guess was too low!\n").to_stdout
      end
    end

    context 'when the guess was correct' do
      it 'displays the correct message' do
        allow(guess).to receive(:result).and_return('correct')
        expect{ui.display_guess_result(guess: guess)}.to output("\nYour guess was correct!\n").to_stdout
      end
    end
  end

  describe '#display_game_lost_message' do
    let(:magic_number) { 99 }
    it "tells the user they've lost the game" do
      expect{ui.display_game_lost_message(magic_element: magic_number)}.to output("\nOh no! You've run out of chances, so you lose. The number was #{magic_number}.\n").to_stdout
    end
  end
end

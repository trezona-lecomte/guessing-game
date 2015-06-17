require 'spec_helper'
require 'console_ui'
require 'byebug'

RSpec.describe ConsoleUI do
  let(:lower_bound) { 1 }
  let(:upper_bound) { 100 }
  let(:ui) { ConsoleUI.new }

  describe '#display_welcome_message' do
    it 'welcomes the user' do
      expect{ui.display_welcome_message}.to output("Welcome to the magical number guessing game!\n").to_stdout
    end
  end

  describe '#get_guess' do
    context 'before getting the guess' do
      it 'prompts the user for their guess' do
        allow(STDIN).to receive(:gets) { "99" }
        expect{ui.get_guess(lower_bound, upper_bound)}.to output("Please enter a number between #{lower_bound} and #{upper_bound}\n").to_stdout
      end
    end

    context 'when given a valid guess' do
      it 'returns guess as an integer from stdin' do
        allow(STDIN).to receive(:gets) { "99" }
        expect(ui.get_guess(lower_bound, upper_bound)).to eq(99)
      end
    end

    context 'when given an invalid guess' do
      it 'asks the user for another guess' do
        allow(STDIN).to receive(:gets).once { "Womack! Why am I not surprised, you piece of shit!" }
        # byebug
        expect{ui.get_guess(lower_bound, upper_bound)}.to output("Please enter a number between #{lower_bound} and #{upper_bound}\n").twice.to_stdout
      end
    end
  end

  describe '#display_guess_result' do
    context 'when the guess was too high' do
      it 'displays the too high message' do
        expect{ui.display_guess_result('too high')}.to output("\nYour guess was too high!\n").to_stdout
      end
    end

    context 'when the guess was too low' do
      it 'displays the too high message' do
        expect{ui.display_guess_result('too low')}.to output("\nYour guess was too low!\n").to_stdout
      end
    end

    context 'when the guess was correct' do
      it 'displays the too high message' do
        expect{ui.display_guess_result('correct')}.to output("\nYour guess was correct!\n").to_stdout
      end
    end
  end

  describe '#display_game_lost_message' do
    let(:magic_number) { 99 }
    it "tells the user they've lost the game" do
      expect{ui.display_game_lost_message(magic_number)}.to output("\nOh no! You've run out of chances, so you lose. The number was #{magic_number}.\n").to_stdout
    end
  end
end

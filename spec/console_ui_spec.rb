require 'spec_helper'
require 'console_ui'

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
    context 'when given a valid guess' do
      it 'returns guess as a number from STDIN' do
      	allow(STDIN).to receive(:gets) { "#{upper_bound}" }
        expect(ui.get_guess(lower_bound, upper_bound)).to eq(upper_bound)
      end
    end

    context 'when given an invalid guess' do
    	it 'returns nil' do
      	allow(STDIN).to receive(:gets) { 'Womack! Why am I not surprised, you piece of shit!' }
        expect(ui.get_guess(lower_bound, upper_bound)).to be nil
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

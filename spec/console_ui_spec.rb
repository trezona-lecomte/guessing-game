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

  describe '#display_too_high_message' do
  	it "tells the user they've guessed too high" do
			expect{ui.display_too_high_message(lower_bound)}.to output("\nYour guess of #{lower_bound} was too high!\n").to_stdout
  	end
  end

  describe '#display_too_low_message' do
  	it "tells the user they've guessed too low" do
  		expect{ui.display_too_low_message(lower_bound)}.to output("\nYour guess of #{lower_bound} was too low!\n").to_stdout
  	end
  end

  describe '#display_game_won_message' do
  	it "tells the user they've won the game" do
  		expect{ui.display_game_won_message}.to output("\nCongratulations, you guessed correctly!\n").to_stdout
  	end
  end

  describe '#display_game_lost_message' do
  	let(:magic_number) { 99 }
  	it "tells the user they've lost the game" do
  		expect{ui.display_game_lost_message(magic_number)}.to output("\nOh no! You've run out of chances, so you lose. The number was #{magic_number}.\n").to_stdout
  	end
  end
end

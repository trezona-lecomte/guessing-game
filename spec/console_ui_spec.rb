require 'spec_helper'
require 'console_ui'

RSpec.describe ConsoleUI do
	let(:lower_bound) { 1 }
	let(:upper_bound) { 100 }
	let(:ui) { ConsoleUI.new }

  describe '#welcome' do
    it 'welcomes the user' do
      expect{ui.welcome}.to output("Welcome to the magical number guessing game!\n").to_stdout
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

  describe '#say_too_high' do
  	it "tells the user they've guessed too high" do
			expect{ui.say_too_high(lower_bound)}.to output("Sorry, your guess of #{lower_bound} was too high! Try guessing lower.\n").to_stdout
  	end
  end
end

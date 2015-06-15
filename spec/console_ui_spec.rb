require 'spec_helper'
require 'console_ui'

RSpec.describe ConsoleUI do
	let(:ui) { ConsoleUI.new }
	
  describe '#welcome' do
    it 'welcomes the user' do
      expect{ui.welcome}.to output("Welcome to the magical number guessing game!\n").to_stdout
    end
  end
end

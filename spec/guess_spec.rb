require "guess"

RSpec.describe Guess do
  let (:guess) { Guess.new(1) }

  describe "#compare_to" do
    before { guess.compare_to(other_value: hidden_value) }

    context "when the guess is valid" do
      context "when the guess is too high" do
        let(:hidden_value) { 0 }

        it "sets the result to 'too high'" do
          expect(guess.result).to eq("too high")
        end
      end

      context "when the guess is too low" do
        let(:hidden_value) { 2 }

        it "sets the result to 'too low'" do
          expect(guess.result).to eq("too low")
        end
      end

      context "when the guess is correct" do
        let(:hidden_value) { 1 }

        it "sets the result to 'correct'" do
          expect(guess.result).to eq("correct")
        end
      end
    end

    context "when the guess is invalid" do
      let(:hidden_value) { "1" }

      it "sets the result to 'invalid'" do
        expect(guess.result).to eq("invalid")
      end
    end
  end
end

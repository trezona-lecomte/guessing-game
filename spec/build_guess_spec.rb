require "spec_helper"
require "build_guess"
require "guess"

RSpec.describe BuildGuess do

  describe "#call" do
    context" when passed a valid guess" do
      %w(1 100 50).each do |v|
        it "returns a guess with value: #{v}" do
          expect(BuildGuess.call(range: (1..100), user_input: v).value).to eq(Guess.new(v.to_i).value)
        end
      end
    end

    context "when passed an out-of-range guess" do
      %w(-1 0.99 100.1 101 1_000_000_000_000_000 50.0).each do |v|
        it "returns nil for: #{v}" do
          expect(BuildGuess.call(range: (1..100), user_input: v)).to eq(nil)
        end
      end
    end

    context "when passed invalid user_input" do
      %w(^ c adlskfjs\n).each do |v|
        it "returns nil for: #{v}" do
          expect(BuildGuess.call(range: (1..100), user_input: v)).to eq(nil)
        end
      end
    end
  end
end

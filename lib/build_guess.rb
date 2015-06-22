require_relative 'guess'

class BuildGuess

  def self.call(range:, guess_str:)
    begin
      case range.first.class.to_s
      when 'Fixnum', 'Bignum'
        guess = Guess.new(Integer(guess_str))
      when 'String'
        guess = Guess.new(guess_str)
      end

      guess = nil unless range.include?(guess.value)
    rescue
      guess = nil
    end

    guess
  end
end

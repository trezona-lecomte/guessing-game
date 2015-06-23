require_relative 'guess'

class BuildGuess

  def self.call(range:, user_input:)
    begin
      case range.first.class.to_s
      when 'Fixnum', 'Bignum'
        guess = Guess.new(Integer(user_input))
      when 'String'
        guess = Guess.new(user_input)
      end

      return unless range.include?(guess.value)
        guess
    rescue
      guess = nil
    end
  end
end

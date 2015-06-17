require 'byebug'

class Guess
  attr_reader :valid, :value, :result

  def build(range:, guess_str:)
    begin
      case range.first.class.to_s

      when 'Fixnum', 'Bignum'
        @value = Integer(guess_str)
        @valid = true

      when 'String'
        @value = guess_str
        @valid = true

      else
        raise Exception
      end
    rescue Exception
      @valid = false
    end
  end

  def set_result(other_element:)
    @result = 'too high' if @value  > other_element
    @result = 'too low'  if @value  < other_element
    @result = 'correct'  if @value == other_element
  end

  def too_high?
    @result == 'too high'
  end

  def too_low?
    @result == 'too low'
  end

  def correct?
    @result == 'correct'
  end
end

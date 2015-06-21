class Guess
  attr_reader :value, :result

  def initialize(value)
    @value = value
  end

  def set_result_of_comparison(other_value:)
    begin
      @result = 'too high' if @value  > other_value
      @result = 'too low'  if @value  < other_value
      @result = 'correct'  if @value == other_value
    rescue
      @result = 'invalid'
    end
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

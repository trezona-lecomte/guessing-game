class GuessingGame
  attr_reader :chances_left, :lower_bound, :upper_bound, :last_guess_result

  def initialize(range: (1..100), chances: 6)
    @range = range
    @chances_left = chances
    @magic_element = rand(@range)
  end

  def make_guess(guess)
    @last_guess = guess

    if @range.include?(guess)
      update_last_guess_result

      expend_chance
    end
  end

  def won?
    @last_guess_result == 'correct'
  end

  def lost?
    !won? && @chances_left == 0
  end

  def reveal_magic_element
    @magic_element if won? || lost?
  end

  private
    # TODO is there a DRYer way to set the last_guess_result?
    def update_last_guess_result
      @last_guess_result = 'too high' if @last_guess > @magic_element
      @last_guess_result = 'too low'  if @last_guess < @magic_element
      @last_guess_result = 'correct'  if @last_guess == @magic_element
    end

    def expend_chance
      unless @chances_left == 0
        @chances_left -= 1
      end
    end
end

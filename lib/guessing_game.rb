class GuessingGame
  attr_reader :chances_left, :range, :guesses

  def initialize(range: (1..100), chances: 6)
    @range = range
    @chances_left = chances
    @hidden_value = @range.to_a.sample
    @guesses = []
  end

  def try_guess(guess)
    @guesses.push(guess)

    if @range.include?(guess.value)
      guess.set_result_of_comparison(other_value: @hidden_value)

      expend_chance
    end
  end

  def won?
    @guesses.any? { |guess| guess.correct? }
  end

  def lost?
    @chances_left == 0 && !won?
  end

  def reveal_hidden_value
    @hidden_value if won? || lost?
  end

  private
    def expend_chance
      unless @chances_left == 0
        @chances_left -= 1
      end
    end
end

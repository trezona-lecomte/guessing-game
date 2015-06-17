class GuessingGame
  attr_reader :chances_left, :range, :guesses

  def initialize(range: (1..100), chances: 6)
    @range = range
    @chances_left = chances
    @magic_element = rand(@range)
    @guesses = []
  end

  def try_guess(guess:)
    @guesses.push(guess)

    if @range.include?(guess.value)
      guess.set_result(other_element: @magic_element)

      expend_chance
    end
  end

  def won?
    @guesses.any? { |guess| guess.correct? }
  end

  def lost?
    !won? && @chances_left == 0
  end

  def reveal_magic_element
    @magic_element if won? || lost?
  end

  private
    def expend_chance
      unless @chances_left == 0
        @chances_left -= 1
      end
    end
end

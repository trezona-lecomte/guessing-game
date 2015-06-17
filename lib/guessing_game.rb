class GuessingGame
  attr_reader :chances_left, :lower_bound, :upper_bound, :last_guess_result

  # TODO use range instead of lower/upper bounds
	def initialize(lower_bound = 1, upper_bound = 100)
		@chances_left = 6
		@upper_bound = upper_bound
		@lower_bound = lower_bound
		@magic_number = rand(lower_bound..upper_bound)
	end

	# TODO is there a DRYer way to set the last_guess_result?
  def make_guess(guess)
    @last_guess = guess

    if guess.between?(@lower_bound, @upper_bound)
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

  def reveal_magic_number
    @magic_number if won? || lost?
  end

	private
		def update_last_guess_result
    	@last_guess_result = 'too high' if @last_guess > @magic_number
    	@last_guess_result = 'too low'  if @last_guess < @magic_number
    	@last_guess_result = 'correct'	if @last_guess == @magic_number
    end

		def expend_chance
			unless @chances_left == 0
				@chances_left -= 1
			end
		end
end

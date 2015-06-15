class GuessingGame
	# attr_accessor :user_guess
	attr_accessor :lower_bound, :upper_bound, :chances_left, :last_guess

	def initialize(lower_bound, upper_bound)
		@chances_left = 6
		@upper_bound = upper_bound
		@lower_bound = lower_bound
		@magic_number = rand(lower_bound..upper_bound)
	end

	def valid_guess?(guess)
		guess.between?(@lower_bound, @upper_bound) ? true : false
	end

  def make_guess(guess)
    @last_guess = guess
    if valid_guess?(guess)
      expend_chance
    end
  end

	def guess_too_high?(guess)
		guess > @magic_number
	end

	def guess_too_low?(guess)
		guess < @magic_number
	end

  def game_won?
    last_guess_correct?
  end

	private
		def expend_chance
			unless @chances_left == 0
				@chances_left -= 1
			end
		end

    def last_guess_correct?
      @last_guess == @magic_number
    end
end

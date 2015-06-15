class GuessingGame
	# attr_accessor :user_guess
	attr_accessor :lower_bound, :upper_bound

	def initialize(lower_bound, upper_bound)
		@upper_bound = upper_bound
		@lower_bound = lower_bound
		@magic_number = rand(lower_bound..upper_bound)
	end

	def valid_guess?(guess)
		guess.between?(@lower_bound, @upper_bound) ? true : false
	end
end
